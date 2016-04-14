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

  #def format_date(options = {})
  	#start_date = options[:start_date]
  	#end_date = options[:end_date]
  	#due = options[:due]
  #if due
  	#dates = @due.strftime("%D")
  #elsif start_date
  	#dates = @start_date.strftime("%D")
  	#if end_date
  		#dates << " -- " + @end_date.strftime("%D")
  	#end
  #else
  	#dates = "N/A" if !dates
  #end
  #return dates
#end

  def format_priority(priority)
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    if !value
 raise UdaciListErrors::InvalidPriorityValue, "#{priority}"
    end
    return value
  end
end

