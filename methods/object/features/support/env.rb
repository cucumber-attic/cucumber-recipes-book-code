require 'mechanize'
require './lib/book_page'

module KnowsBookPage
  def page
    @page ||= BookPage.new
  end
end

World(KnowsBookPage)
