class BookPage
  def visit_book_page(title)
    urls    = {'Cucumber Recipes' => 'http://pragprog.com/titles/dhwcr'}
    url     = urls[title] || raise("Unknown title #{title}")
    browser = Mechanize.new
    @page   = browser.get url
  end

  def find_related_titles
    css = 'table#related-books td.description a'
    @related = @page.search(css).map &:content
  end

  def verify_related_title(title)
    @related.should include(title)
  end
end
