@students = []
@line_break = "------------------"

def interactive_menu
    loop { show_menu
      menu_function(STDIN.gets.chomp) }
end

def show_menu
    puts "1. Input the students\n2. Show the students\n"
    puts "3. Save the list to students.csv\n4. Load the list from students.csv"
    puts "9. Exit"
end

def menu_function(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_file
    when "4"
        load_file
    when "9"
        exit
    else
        puts "I don't know what you mean, try again"
    end
end

def input_students
    puts "Please enter the names of the students\n To finish, just hit return twice"

    name = STDIN.gets.chomp

    while !name.empty? do
        add_student(name)
        if @students.count > 1
            puts "Now we have #{@students.count} students"
        else
            puts "Now we have #{@students.count} student"
        end
            name = STDIN.gets.chomp
        end
end

def add_student(name, cohort=:november)
    @students << {name: name, cohort: cohort.to_sym}
end

def show_students
    print_header
    print_student_list
    print_footer
end

def print_header
    puts "The students of Villains Academy".center(40)
    puts @line_break.center(40)
end

def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def print_footer
    puts @line_break.center(40)
    if @students.count > 1
        puts "Overall, we have #{@students.count} great students".center(40)
    else
        puts "Overall, we have #{@students.count} great student".center(40)
    end
end

def save_file
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_file
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_student(name, cohort)
    end
    file.close
end

def try_load_students
    filename = "students.csv"
    return if filename.nil?
    if File.exists?(filename)
        load_file
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

try_load_students
interactive_menu
