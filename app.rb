 #require 'bundler/setup
 require 'win32/sound'
 include Win32
 require 'chronic'
 require 'colorize'
 require 'date'
 require 'artii'
 require 'terminal-table'
 require 'barometer'
 

 

 require_relative "lib/listable"
 require_relative "lib/errors"
 require_relative "lib/udacilist"
 require_relative "lib/todo"
 require_relative "lib/event"
 require_relative "lib/link"




 a = Artii::Base.new :font => 'slant'
 puts a.asciify("Udacitask II")


 barometer = Barometer.new("Austin")
 weather = barometer.measure

 puts "Current Temp is : #{weather.current.temperature.f} degrees".colorize(:yellow)
weather.current       # returns the first successful current_measurement
weather.forecast      # returns the first successful forecast_measurements
weather.today         # returns the first successful forecast_measurement for today
weather.tomorrow      # returns the first successful forecast_measurement for tomorrow
puts "Tomorrow's high will reach : #{weather.tomorrow.high.f} degrees".colorize(:yellow)







#sound = Sound.play('chimes.wav')
list = UdaciList.new(title: "Julia's Stuff".colorize(:magenta))
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all
list.delete(3)
list.all


# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
 new_list = UdaciList.new # Should create a list called "Untitled List"

 new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
 new_list.add("todo", "Go dancing", due: "in 2 hours")
 new_list.add("todo", "Buy groceries", priority: "high")
 new_list.add("event", "Birthday Party", start_date: "May 31")
 new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
 new_list.add("event", "Life happens")
 new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
 new_list.add("link", "http://ruby-doc.org")


# SHOULD RETURN ERROR MESSAGES
 #----------------------------
 #new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
 #new_list.delete(9) # Throws an IndexExceedsListSize error
 #new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
sound = Sound.play('chimes.wav')
new_list.all
new_list.change_priority(2, "high")
#new_list.all





# DEMO FILTER BY ITEM TYPE
# ------------------------

new_list.filter("event")
#new_list.all



#new_list.clear_list

#new_list.all
