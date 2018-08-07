class Project
    def initialize(name, descript)
        @projectname = name
        @description = descript
    end

    def elevator_pitch
        puts "Project: #{@projectname}, #{@description}"
    end
end
project1 = Project.new("Project 1", "Description 1")
project1.elevator_pitch  
