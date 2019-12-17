class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all.push(self)
    end

    def pass_student(student, testname)
       if test_exist(student, testname)
        test_exist(student, testname).status = "passed"
       else 
        BoatingTest.new(student, testname, "passed", self)
       end
    end

    def fail_student
        if test_exist(student, testname)
            test_exist(student, testname).status = "failed"
        else 
            BoatingTest.new(student, testname, "failed", self)
        end
    end

    def test_exist(student, testname)
        BoatingTest.all.find do |tests|
            # binding.pry
            tests.student == student && tests.name == testname
        end
    end
end
