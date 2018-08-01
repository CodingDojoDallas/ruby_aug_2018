class Project
    attr_accessor :name, :desc
    def initialize(name, des)
        @name = name
        @description = des
    end
    def elevator_pitch
        print @name,', ', @description
        # puts @name, @description
    end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.name # => "Project 1"
project1.elevator_pitch  # => "Project 1, Description 1"
