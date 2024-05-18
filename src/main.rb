require 'csv'
require 'pry'
require 'pry-nav'


def add_entry(file_path)
  print("Enter id,name,description: ")
  command = gets.chomp
  CSV.open(file_path, "a") do |csv|
    new_record = command.split(',')
    
    csv << new_record
  end
end

def view_entry(file_path);end
def delete_entry(file_path);end
def  update_entry(file_path);end

file_path = 'studentskiller.csv'

loop do 
  puts "\n1. Add a record"
  puts "2. View a record"
  puts "3. Delete a record"
  puts "4. Update a record"
  puts "5. Exit"

  puts "Escolha uma opção: "
  option = gets.strip.to_i


  case option
  when 1
      add_entry(file_path)
  when 2
      view_entry(file_path)
  when 3
      delete_entry(file_path)
  when 4
      update_entry(file_path)
  when 5
    exit()
  else
    puts "choice invalid."
  end
end