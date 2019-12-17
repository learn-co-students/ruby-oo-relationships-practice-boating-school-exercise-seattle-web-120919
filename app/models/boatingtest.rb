class BoatingTest
    attr_reader :student, :name, :instructor
    attr_accessor :status

    @@all = []

    def initialize(student, name, status, instructor)
        @student = student
        @name = name
        @status = status
        @instructor = instructor
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all.push(self)
    end
end
