require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = false 

  def test_project_rolls_back_when_task_validation_fails
    @project = Project.create :name => 'Foo', :tasks_attributes => { '0' => { :name => 'Bar', :fail => :in_validation } }

    assert @project.tasks.first.new_record?
    assert @project.new_record?
  end

  def test_project_rolls_back_when_task_before_save_fails
    @project = Project.create :name => 'Foo', :tasks_attributes => { '0' => { :name => 'Bar', :fail => :before_save } }

    assert @project.tasks.first.new_record?
    assert @project.new_record?
  end

  def test_project_rolls_back_when_task_after_save_fails
    @project = Project.create :name => 'Foo', :tasks_attributes => { '0' => { :name => 'Bar', :fail => :after_save } }

    assert @project.tasks.first.new_record?
    assert @project.new_record?
  end
end
