
require_relative 'project' #include our Project class in our spec file
=begin
RSpec.describe Project do
  before(:each) do
    @project1 = Project.new('Project 1', 'description 1') # create a new project and make sure we can set the name attribute
  end

  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line
  end
end
=end
RSpec.describe Project do
  before(:each) do
    # updated this block to create two projects
    @project1 = Project.new('Project 1', 'description 1', 'John Doe', ['task1', 'task2', 'task4'])
    @project2 = Project.new('Project 2', 'description 2', 'Jane Doe', ['task1', 'task2'])
  end

  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line
  end

  it 'has a method elevator_pitch to explain name, description, and owner' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1, John Doe")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2, Jane Doe")
  end

  it 'has a method tasks that returns the tasks for each project' do
    expect(@project1.tasks).to eq(["task1", "task2", "task4"])
    expect(@project2.tasks).to eq(["task1", "task2"])
  end

  context 'testing add_tasks method' do
    it 'will add a task' do
      expect(@project1.add_tasks("task3")).to be_truthy
      expect(@project2.add_tasks("task3")).to be_truthy
    end
    it 'will not add a task' do
      expect(@project1.add_tasks(123)).to_not be_truthy
      expect(@project2.add_tasks(123)).to_not be_truthy
    end
  end

  it 'has a method print_tasks that will print each task' do
    expect { @project1.print_tasks }.to output("task1task2task4").to_stdout
    expect { @project2.print_tasks }.to output("task1task2").to_stdout
    # expect(@project1.print_tasks).to eq(["task1", "task2", "task4"])
    # expect(@project2.print_tasks).to eq(["task1", "task2"])
  end
end
