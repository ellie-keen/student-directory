def interactive_menu
  students = []
    loop do

# 1. print the menu and ask the user what to do
     puts "1. Input the students"
     puts "2. Show the students"
     puts "9. Exit"
# 2. read the input and save it into a variable
     selection = gets.chomp
# 3. do what the user has asked.
     case selection
     when "1"
        students = input_students
# input the students
     when "2"
        print_header
        print(students)
        print_footer(students)
# show the students
     when "9"
       exit
     else puts "I don't know what you meant, try again"
# 4. repeat from step 1
     end
   end
end


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"

    students = []
    name = gets.strip

    while !name.empty? do
      students << {name: name, cohort: :november}
      if students.count > 1
          puts "Now we have #{students.count} students"
      else
          puts "Now we have #{students.count} student"
      end
          name = gets.strip
    end

students
end

def print_header
    puts "The students of Villains Academy".center(40)
    puts "------------------".center(40)
end

def print(students)

    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def print_footer(students)

    puts "------------------".center(40)

    if students.count > 1
        puts "Overall, we have #{students.count} great students".center(40)
    else
        puts "Overall, we have #{students.count} great student".center(40)
    end
end

interactive_menu
