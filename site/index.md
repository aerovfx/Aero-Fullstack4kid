---
layout: default
title: Danh mục khóa học
---
<link rel="stylesheet" href="{{ site.baseurl }}/assets/style.css">

<section class="hero">
  <h1>Fullstack4kid Academy</h1>
  <p class="tagline">
    Kho giáo trình công nghệ theo lộ trình theo tuần (10–20 tuần, bám sát giáo trình quốc tế: CEH v13, CCNA, GDCT…),
    gồm bài giảng, code minh hoạ, bài tập minh hoạ, đồ án và tư liệu tham khảo cho <strong>6 nhóm ngành</strong>.
  </p>
</section>

<nav class="quick-nav">
  <a href="#n1">AI &amp; Data Science</a>
  <a href="#n2">Software Engineering</a>
  <a href="#n3">Infra &amp; Networking</a>
  <a href="#n4">Cybersecurity</a>
  <a href="#n5">Graphics &amp; HCI</a>
  <a href="#n6">Hardware &amp; Embedded</a>
</nav>

<p class="lead">
  👉 Bấm vào từng khóa học để xem góc nhìn chi tiết và mở toàn bộ tài liệu
  (<code>INDEX.md</code>, <code>schedule.md</code>, <code>lessons/</code>, <code>code/</code>, <code>projects/</code>)
  trên GitHub.
</p>

{% assign groups = site.data.courses %}
{% for group in groups %}
<section class="group" id="{{ group.id }}">
  <h2><span class="num">{{ group.num }}</span> {{ group.name }}</h2>
  <p class="group-desc">{{ group.description }}</p>

  <table class="course-table">
    <thead>
      <tr><th>Khóa học</th><th>Lộ trình</th><th>Học liệu</th></tr>
    </thead>
    <tbody>
      {% for c in group.courses %}
      <tr>
        <td>
          <a class="course-name" href="{{ site.baseurl }}{{ c.url }}">
            {{ c.title }}
          </a>
          {% if c.path contains "cybersecurity-10weeks" %}
            <span class="new-badge">NEW · CEH v13 20 tuần</span>
          {% endif %}
        </td>
        <td>{{ c.weeks }}</td>
        <td class="links">
          {% if c.path %}
            <a href="{{ site.github_repo }}/blob/{{ site.github_branch }}/{{ c.path }}/INDEX.md" target="_blank" rel="noopener">Giáo trình</a>
            <a href="{{ site.github_repo }}/blob/{{ site.github_branch }}/{{ c.path }}/schedule.md" target="_blank" rel="noopener">Lịch</a>
            <a href="{{ site.github_repo }}/tree/{{ site.github_branch }}/{{ c.path }}/projects" target="_blank" rel="noopener">Đồ án</a>
          {% endif %}
        </td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</section>
{% endfor %}

<footer>
  <p><a href="{{ site.github_repo }}" target="_blank" rel="noopener">Source repository ↗</a> · © {{ "now" | date: "%Y" }} {{ site.title }}</p>
</footer>