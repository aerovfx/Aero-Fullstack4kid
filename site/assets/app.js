(function () {
  const search = document.querySelector('[data-course-search]');
  const filters = [...document.querySelectorAll('[data-filter]')];
  const cards = [...document.querySelectorAll('[data-course-card]')];
  const empty = document.querySelector('[data-empty]');
  let activeGroup = 'all';

  function normalize(value) {
    return (value || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  }

  function updateCourses() {
    const query = normalize(search && search.value);
    let visible = 0;
    cards.forEach((card) => {
      const matchesText = !query || normalize(card.textContent).includes(query);
      const matchesGroup = activeGroup === 'all' || card.dataset.group === activeGroup;
      const show = matchesText && matchesGroup;
      card.hidden = !show;
      if (show) visible += 1;
    });
    if (empty) empty.hidden = visible !== 0;
  }

  if (search) search.addEventListener('input', updateCourses);
  filters.forEach((button) => button.addEventListener('click', () => {
    activeGroup = button.dataset.filter;
    filters.forEach((item) => item.setAttribute('aria-pressed', String(item === button)));
    updateCourses();
  }));

  document.querySelectorAll('pre').forEach((pre) => {
    const button = document.createElement('button');
    button.className = 'copy-code';
    button.type = 'button';
    button.textContent = 'Sao chép';
    button.addEventListener('click', async () => {
      await navigator.clipboard.writeText(pre.innerText);
      button.textContent = 'Đã chép';
      setTimeout(() => { button.textContent = 'Sao chép'; }, 1500);
    });
    pre.appendChild(button);
  });
}());
