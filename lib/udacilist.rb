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

  def delete(index)
    indexlimit = @items.length
    if index > indexlimit then
      raise UdaciListErrors::IndexExceedsListSize
      "{index} is not valid, must be #{indexlimit} or lower}"
    else
    @items.delete_at(index - 1)
  end
end


  def all
    #puts "-" * @title.length
    #puts @title
    #puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
