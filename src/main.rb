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

def view_entry(file_path)
  data = CSV.read(file_path)
  first_row_size = data[0].size
  columns = (0...first_row_size).to_a

  widths = columns.map do |column|
    data.map { |row| row[column].size}.max
  end
  

  data.first.each_with_index do |column, index|

    if column.strip.size <= widths[index] /2
    just_space_column = column.rjust(widths[index])
    else
    just_space_column = column.ljust(widths[index])
    end

    print "#{just_space_column} | "
  end
  puts

  columns_with_header = data[1..-1]

  columns_with_header.each do |row|
    row.each_with_index do |column, index|
      just_space_column = column.ljust(widths[index])
      print column.ljust(widths[index]) + ' | '
    end
    puts
  end
end
def delete_entry(file_path)

print "Enter id in of delete: "
  id = gets.chomp.to_i

  table = CSV.table(file_path)

  table.delete_if do |row|
    row[:id] == id
  end

  File.open(file_path, 'w') do |file|
    file.write(table.to_csv)
  end
end

def  update_entry(file_path)
  print "Enter with id for update: "
  id = gets.chomp.to_i

  table = CSV.table(file_path)

  table.each do |row|
    if row[:id] == id
      print "Enter with name: "
      row[:name] = gets.chomp
      print "Enter with age: "
      row[:age] = gets.chomp
      print "Enter with address: "
      row[:address] = gets.chomp
      print "Enter with salary: "
      row[:salary] = gets.chomp
    end
  end

  File.open(file_path, 'w') do |file|
    file.write(table.to_csv)
  end
end
file_path = '../data/studentskiller.csv'
puts 'Enter the file path: '
file_path = gets.chomp
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