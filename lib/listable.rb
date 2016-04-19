module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(start_date, end_date = false)
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end


  def format_priority(priority)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:green) if @priority == "low"
    value = "" if !@priority
    if !value
 raise UdaciListErrors::InvalidPriorityValue, "#{priority}"
    end
    return value
  end

  
  
end