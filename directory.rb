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

students = input_students

print_header
if students.count >= 1
  print(students)
  print_footer(students)
end
