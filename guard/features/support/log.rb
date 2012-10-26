class Log
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def append(priority, message)
    @contents << priority[0].upcase << ' ' << message
  end

  def parse
    @contents.split("\n").map do |line|
      initial, message = line.split(" ", 2)
      priorities = { 'I' => 'information', 'W' => 'warning' }
      { 'priority' => priorities[initial], 'message' => message }
    end
  end
end
