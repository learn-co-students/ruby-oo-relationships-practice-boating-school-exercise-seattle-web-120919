class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all.push(self)
    end

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end

    def grade_percentage
        grade = passing_tests.length / tests.length.to_f
        gradepercent = grade * 100
        gradepercent.round(2)
    end

    def passing_tests
        tests.find_all do |test|
            test.status == "passed"
        end
    end

    def tests
        BoatingTest.all.find_all do |tests|
            tests.student == self
        end
    end

    def self.find_student(name)
        @@all.find do |students|
            students.first_name == name
            # binding.pry
        end
    end


end
