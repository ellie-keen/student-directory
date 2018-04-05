@students = []

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"

    name = gets.strip

    while !name.empty? do
      @students << {name: name, cohort: :november}
      if @students.count > 1
          puts "Now we have #{@students.count} students"
      else
          puts "Now we have #{@students.count} student"
      end
          name = gets.strip
    end
end

def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
    puts "The students of Villains Academy".center(40)
    puts "------------------".center(40)
end

def print_students_list(students)

    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def print_footer(students)

    puts "------------------".center(40)

    if @students.count > 1
        puts "Overall, we have #{students.count} great students".center(40)
    else
        puts "Overall, we have #{students.count} great student".center(40)
    end
end

interactive_menu
