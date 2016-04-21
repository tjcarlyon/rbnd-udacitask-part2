class UdaciList
  
  
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
    end

  
    def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
    @items.push TodoItem.new(description, options) if type == "todo"
    when "event"
    @items.push EventItem.new(description, options) if type == "event"
    when "link"
    @items.push LinkItem.new(description, options) if type == "link"
    else
     raise UdaciListErrors::InvalidItemType.new "#{type} not supported."
  end
end


def clear_list
   @title = "Cleared List"
    puts "-" * new_title.length
    puts @title
    puts "-" * new_title.length
    counter = 0
    while counter < items.length
      items.delete_at(0)
    end
  end


def filter(type)
   @title = "Filter list"
    puts "-" * new_title.length
    puts @title
    puts "-" * new_title.length
    @items.each_with_index do |item, position|
      if item.class.name.downcase.include? type
        puts "#{position + 1}) #{item.details}"
      end
    end
  end



def delete(index)
    indexlimit = @items.length
    if index > indexlimit then
      raise UdaciListErrors::IndexExceedsListSize
      "{index} is not valid, must be #{indexlimit} or lower}"
    else
    @items.delete_at(index - 1)
  end
end

def new_title
    if @title
      return @title
    else
      @title = "Untitled List".colorize(:blue)
      return @title
    end
  end

  
def all(options ={})
    #sound = Sound.play('chimes.wav')
    puts "-" * new_title.length
    puts @title
    puts "-" * new_title.length
    rows = []
    @items.each_with_index do |item, position|
      rows << [position + 1 , item.details] #{item.details}"
end
table = Terminal::Table.new :rows => rows
    puts table

    end
  end
#end










