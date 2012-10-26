require 'open-uri'

class StockVsStock
  def self.fight sym1, sym2
    uri = URI.parse("http://download.finance.yahoo.com/d/quotes.csv?" +
                    "s=#{sym1}+#{sym2}&f=l1s")

    response = uri.read
    rows     = response.split
    results  = rows.map do |row|
      price, symbol = row.split(',')
      [price.to_f, symbol[1..-2]]
    end

    winning_row = results.sort.last
    winning_row[1] # just the symbol
  end
end
