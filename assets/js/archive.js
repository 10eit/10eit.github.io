(function () {
  const search = document.querySelector('#article-search');
  const articles = Array.from(document.querySelectorAll('[data-article]'));
  const resultCount = document.querySelector('#result-count');
  const emptyState = document.querySelector('#empty-state');
  const archiveKind = document.querySelector('[data-archive-kind]')?.dataset.archiveKind || 'blogs';

  if (!search || !articles.length) return;

  document.querySelectorAll('[data-idea]').forEach((idea, index) => {
    const content = idea.querySelector('[data-idea-content]');
    const toggle = idea.querySelector('[data-idea-toggle]');
    if (!content || !toggle) return;

    const fullHtml = content.innerHTML;
    const fullText = content.textContent.replace(/\s+/g, ' ').trim();
    const previewText = fullText.length > 140 ? `${fullText.slice(0, 140).trimEnd()}…` : fullText;
    const contentId = `idea-content-${index + 1}`;
    const expandLabel = '展开';
    const collapseLabel = '收起';

    content.id = contentId;
    content.textContent = previewText;
    toggle.hidden = false;
    toggle.setAttribute('aria-controls', contentId);

    toggle.addEventListener('click', () => {
      const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
      toggle.setAttribute('aria-expanded', String(!isExpanded));
      toggle.textContent = isExpanded ? expandLabel : collapseLabel;
      if (isExpanded) {
        content.textContent = previewText;
      } else {
        content.innerHTML = fullHtml;
      }
    });
  });

  function updateResults() {
    const query = search.value.trim().toLocaleLowerCase();
    let visible = 0;

    articles.forEach((article) => {
      const matchesQuery = !query || article.dataset.search.includes(query);
      const shouldShow = matchesQuery;
      article.hidden = !shouldShow;
      if (shouldShow) visible += 1;
    });

    const noun = archiveKind === 'ideas' ? '条想法' : '篇博客';
    resultCount.textContent = query ? `找到 ${visible} ${noun}` : `显示全部 ${visible} ${noun}`;
    emptyState.hidden = visible !== 0;
  }

  search.addEventListener('input', updateResults);
})();
