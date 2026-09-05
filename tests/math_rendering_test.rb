require 'minitest/autorun'
require 'kramdown'
require 'kramdown-parser-gfm'

class MathRenderingTest < Minitest::Test
  ROOT = File.expand_path('..', __dir__)

  def render(source)
    Kramdown::Document.new(source, input: 'GFM', math_engine: 'mathjax', syntax_highlighter: nil).to_html
  end

  def post(name)
    source = File.read(File.join(ROOT, '_posts', name)).split(/^---\s*$\n?/, 3).last
    # Jekyll resolves these Liquid asset URLs before Markdown conversion.
    source.gsub(/\{\{\s*'([^']+)'\s*\|\s*relative_url\s*\}\}/, '\1')
  end

  def test_wend_paragraph_is_not_a_table_and_all_math_survives
    html = render(post('2026-09-03-wend-solver-cognitive-foraging.md'))
    refute_includes html, '<table'
    assert_equal 32, html.scan(/\\\(/).size
    assert_equal 2, html.scan(/\\\[/).size
    assert_equal 4, html.scan('<img ').size
    assert_includes html, '\(M\in\{0,1\}^{N\times N}\)'
    assert_includes html, '\(\vert P_k\vert =\ell_k\)'
    assert_includes html, '\begin{aligned}'
    refute_includes html, '$'
  end

  def test_quoted_display_math_keeps_tex_but_not_markdown_quote_markers
    html = render("> $$\n> L=\\{a\\in A:a<b\\}.\n> $$\n")
    assert_includes html, '<blockquote>'
    assert_includes html, '\[L=\{a\in A:a&lt;b\}.\]'
    refute_includes html, '&gt;'
  end

  def test_code_and_real_tables_still_work
    html = render("`$x$`\n\n| A | B |\n| --- | --- |\n| $$x$$ | $$y$$ |\n")
    assert_includes html, '<code>$x$</code>'
    assert_includes html, '<table>'
    assert_includes html, '<td>\(x\)</td>'
  end

  def test_other_math_posts_have_no_unparsed_dollars_or_accidental_tables
    Dir[File.join(ROOT, '_posts', '*.md')].each do |path|
      next unless File.read(path).include?('$$')
      html = render(post(File.basename(path)))
      assert_equal 0, html.count('$'), path
      expected_tables = path.end_with?('radiation.md') ? 3 : 0
      assert_equal expected_tables, html.scan('<table').size, path
    end
  end
end
