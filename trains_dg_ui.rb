require 'pg'
require './lib/station'
require './lib/line'
require './lib/stop'

DB = PG.connect(:dbname => 'trains')

def welcome
  puts "Welcome to the Train System."
  main_menu
end


def main_menu
  choice = nil
  until choice == 'x'
    puts "Press 'l' to add lines, 's' to add stations, 'v' to view stops or stations."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'l'
      add_lines
    when 's'
      add_stations
    when 'v'
      view
    when 'x'
      exit
    else
      invalid
    end
  end
end

def add_lines
  puts "Enter the name of a line to add:"
  new_line = gets.chomp
  line = Line.new(new_line)
  puts "You have entered #{new_line}. Are you sure? (y/n)"
  line.save unless gets.chomp.downcase != 'y'
end

def add_stations
  puts "Enter the name of a station to add:"
  new_station = gets.chomp
  station = Station.new(station_line)
  puts "You have entered #{new_station}. Are you sure? (y/n)"
  station.save unless gets.chomp.downcase != 'y'
end

def view
choice = nil
  until choice == 'x'
    puts "Press 'l' to view lines for a given station, 's' to view stations for a given line."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'l'
      view_lines
    when 's'
      view_stations
    when 'x'
      exit
    else
      invalid
    end
  end
end

def view_lines
  puts "Which station do you want to view lines for?"
  line_choice = gets.chomp
  #add search method to retrieve line id.
  line.view.each { |station| puts station.name }
end


def view_stations
  station.view.each { |line| puts line.name }

end

def exit
  puts "Exiting."
end

def invalid
  puts "Invalid entry."
end

welcome