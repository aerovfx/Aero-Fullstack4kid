#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require "yaml"

ROOT = File.expand_path("..", __dir__)
SITE = File.join(ROOT, "site")
COURSES = File.join(ROOT, "courses")
OUTPUT = File.join(SITE, "learn")

def front_matter(values)
  "---\n#{values.to_yaml.sub(/\A---\s*\n/, "")}---\n\n"
end

def title_for(path, fallback)
  first_heading = File.foreach(path).find { |line| line.match?(/^#\s+/) }
  first_heading ? first_heading.sub(/^#\s+/, "").strip : fallback
rescue Errno::ENOENT
  fallback
end

def clean_markdown(content)
  content
    .gsub(/\]\(file:\/\/\/[^)]+\/(schedule\.md|projects\/final_project\.md)\)/, "](\1)")
    .sub(/\A#\s+.*\n+/, "")
end

groups = YAML.safe_load(File.read(File.join(SITE, "_data", "courses.yml")), aliases: true)
FileUtils.rm_rf(OUTPUT)
FileUtils.mkdir_p(OUTPUT)

course_count = 0
lesson_count = 0

groups.each do |group|
  group.fetch("courses").each do |course|
    source_dir = File.join(ROOT, course.fetch("path"))
    next unless Dir.exist?(source_dir)

    slug = course.fetch("slug")
    course_dir = File.join(OUTPUT, slug)
    FileUtils.mkdir_p(course_dir)

    code_samples = File.join(source_dir, "code")
    FileUtils.cp_r(code_samples, File.join(course_dir, "code")) if Dir.exist?(code_samples)

    lesson_files = Dir.glob(File.join(source_dir, "lessons", "*.md")).sort
    lessons = lesson_files.map.with_index do |path, index|
      filename = File.basename(path, ".md")
      {
        "title" => title_for(path, filename),
        "url" => "/learn/#{slug}/#{filename}/",
        "path" => path,
        "position" => index
      }
    end

    index_path = File.join(source_dir, "INDEX.md")
    overview = File.exist?(index_path) ? clean_markdown(File.read(index_path)) : "Nội dung tổng quan đang được cập nhật."
    lesson_cards = lessons.map.with_index do |lesson, index|
      number = index + 1
      %(<a class="lesson-card" href="{{ site.baseurl }}#{lesson['url']}"><span>#{number.to_s.rjust(2, '0')}</span><strong>#{lesson['title']}</strong><small>Đọc bài học →</small></a>)
    end.join("\n")

    extras = []
    extras << %(<a class="resource-link" href="{{ site.baseurl }}/learn/#{slug}/schedule/">Lịch học chi tiết</a>) if File.exist?(File.join(source_dir, "schedule.md"))
    extras << %(<a class="resource-link" href="{{ site.baseurl }}/learn/#{slug}/final-project/">Đồ án cuối khóa</a>) if File.exist?(File.join(source_dir, "projects", "final_project.md"))

    course_page = +front_matter(
      "layout" => "course",
      "title" => course.fetch("title"),
      "course_group" => group.fetch("name"),
      "course_path" => course.fetch("path"),
      "weeks" => course.fetch("weeks"),
      "permalink" => "/courses/#{slug}/"
    )
    course_page << "<div class=\"course-actions\">#{extras.join}</div>\n\n"
    course_page << "<section class=\"lesson-section\"><div class=\"section-heading\"><p>Lộ trình học</p><h2>Học theo từng bài</h2><span>#{lessons.length} bài</span></div><div class=\"lesson-grid\">#{lesson_cards}</div></section>\n\n"
    course_page << "<section class=\"markdown-body\" markdown=\"1\"><h2>Tổng quan khóa học</h2>\n\n#{overview}\n</section>\n"
    File.write(File.join(course_dir, "index.md"), course_page)

    lessons.each_with_index do |lesson, index|
      previous = index.positive? ? lessons[index - 1] : nil
      following = index < lessons.length - 1 ? lessons[index + 1] : nil
      values = {
        "layout" => "lesson",
        "title" => lesson.fetch("title"),
        "course_title" => course.fetch("title"),
        "course_url" => "/courses/#{slug}/",
        "lesson_number" => index + 1,
        "lesson_total" => lessons.length,
        "previous_url" => previous&.fetch("url"),
        "previous_title" => previous&.fetch("title"),
        "next_url" => following&.fetch("url"),
        "next_title" => following&.fetch("title"),
        "permalink" => lesson.fetch("url")
      }.compact
      File.write(File.join(course_dir, "#{File.basename(lesson['path'], '.md')}.md"), front_matter(values) + clean_markdown(File.read(lesson.fetch("path"))))
      lesson_count += 1
    end

    { "schedule" => File.join(source_dir, "schedule.md"), "final-project" => File.join(source_dir, "projects", "final_project.md") }.each do |name, path|
      next unless File.exist?(path)
      values = {
        "layout" => "lesson",
        "title" => title_for(path, name),
        "course_title" => course.fetch("title"),
        "course_url" => "/courses/#{slug}/",
        "permalink" => "/learn/#{slug}/#{name}/"
      }
      File.write(File.join(course_dir, "#{name}.md"), front_matter(values) + clean_markdown(File.read(path)))
    end
    course_count += 1
  end
end

warn "Generated #{course_count} courses and #{lesson_count} lessons in #{OUTPUT}"
