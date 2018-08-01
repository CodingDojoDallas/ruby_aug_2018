class Project
  def initialize(name, desc)
    @project_name = name
    @project_desc = desc
  end

  def display_name
    puts "#{@project_name}"
  end

  def elevator_pitch
    puts "#{@project_name}, #{@project_desc}"
  end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.display_name # => "Project 1"
project1.elevator_pitch  # => "Project 1, Description 1"
