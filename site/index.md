---
layout: default
title: Học viện công nghệ thực hành
---
<link rel="stylesheet" href="{{ site.baseurl }}/assets/style.css">
<script defer src="{{ site.baseurl }}/assets/app.js"></script>

<header class="site-header">
  <a class="brand" href="{{ site.baseurl }}/">AERO<span>ACADEMY</span></a>
  <a class="header-link" href="#courses">Khám phá khóa học ↓</a>
</header>

<section class="hero">
  <p class="eyebrow">Học để tạo ra sản phẩm thật</p>
  <h1>Từ dòng code đầu tiên<br>đến <em>tương lai bạn kiến tạo.</em></h1>
  <p class="tagline">Lộ trình công nghệ bằng tiếng Việt, học theo từng tuần, thực hành bằng dự án. Toàn bộ bài giảng Markdown giờ đây có thể đọc trực tiếp trên web.</p>
  <div class="hero-actions">
    <a class="primary-button" href="#courses">Bắt đầu học miễn phí</a>
    <span><strong>33+</strong> khóa học · <strong>6</strong> lĩnh vực</span>
  </div>
</section>

<section class="manifesto" aria-label="Phương pháp học">
  <div><span>01</span><strong>HỌC</strong><p>Kiến thức được chia thành từng bài rõ ràng, dễ theo dõi.</p></div>
  <div><span>02</span><strong>LÀM</strong><p>Code mẫu, bài tập và lab thực hành trong mỗi tuần.</p></div>
  <div><span>03</span><strong>TẠO</strong><p>Hoàn thành đồ án để biến kiến thức thành năng lực.</p></div>
</section>

<section class="catalog" id="courses">
  <div class="catalog-heading">
    <div><p class="eyebrow">Thư viện lộ trình</p><h2>Chọn hướng đi của bạn</h2></div>
    <label class="search-box"><span>⌕</span><input type="search" data-course-search placeholder="Tìm JavaScript, AI, bảo mật..." aria-label="Tìm khóa học"></label>
  </div>

  <div class="filter-row" aria-label="Lọc theo lĩnh vực">
    <button data-filter="all" aria-pressed="true">Tất cả</button>
    {% for group in site.data.courses %}<button data-filter="{{ group.id }}" aria-pressed="false">{{ group.name | remove_first: group.num | remove_first: '. ' }}</button>{% endfor %}
  </div>

  <div class="course-grid">
    {% for group in site.data.courses %}
      {% for c in group.courses %}
      <article class="course-card" data-course-card data-group="{{ group.id }}">
        <div class="card-top"><span>{{ group.num | prepend: '0' }}</span><small>{{ c.weeks }}</small></div>
        <p>{{ group.name | remove_first: group.num | remove_first: '. ' }}</p>
        <h3><a href="{{ site.baseurl }}{{ c.url }}/">{{ c.title }}</a></h3>
        <div class="card-footer"><span>Giáo trình · Bài học · Đồ án</span><a aria-label="Mở khóa học {{ c.title }}" href="{{ site.baseurl }}{{ c.url }}/">↗</a></div>
      </article>
      {% endfor %}
    {% endfor %}
  </div>
  <p class="empty-state" data-empty hidden>Không tìm thấy khóa học phù hợp. Hãy thử một từ khóa khác.</p>
</section>

<footer class="site-footer"><a class="brand" href="{{ site.baseurl }}/">AERO<span>ACADEMY</span></a><p>Kiến thức mở. Tương lai rộng.</p><a href="{{ site.github_repo }}">Mã nguồn ↗</a></footer>
