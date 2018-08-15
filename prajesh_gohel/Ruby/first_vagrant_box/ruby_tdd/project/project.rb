class Project
  attr_accessor :name, :desc, :owner, :tasks
  def initialize(name, desc, owner, tasks)
    @name = name
    @desc = desc
    @owner = owner
    @tasks = tasks
  end

  def display_name
    "#{@name}"
  end

  def elevator_pitch
    "#{@name}, #{@desc}, #{@owner}"
  end

  def tasks
    @tasks
    # @tasks.each do |task|
    #   p task
    # end
  end

  def add_tasks task
    if task.is_a? String
      @tasks.push(task)
      true
    else
      false
    end
  end

  def print_tasks
    @tasks.each do |task|
      print task
    end
  end
end

project1 = Project.new('Project 1', 'description 1', 'John Doe', ['task1', 'task2'])
# puts project1.add_tasks("do something")
p project1.tasks
