require 'cucumber'
require 'term/ansicolor'

Term::ANSIColor.coloring = false

module Term
  module ANSIColor
    def self.coloring=(other)
    end
  end
end

def table
  cars = [{'color' => 'rust', 'model' => 'Camaro'},
          {'color' => 'blue', 'model' => 'Gremlin'}]

  Cucumber::Ast::Table.new(cars)
end

# START:raw
table.raw
# END:raw
