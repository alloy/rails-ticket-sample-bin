require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_case_name
project = Project.create! :owner_attributes => { :name => 'Bello' }

# without attr_accessible
p project.owner # => #<Author id: 980190963, name: "Bello", project_id: 980190963, owner: true, admin: true>

# with: attr_accessible :name
p project.owner # => #<Author id: 980190963, name: "Bello", project_id: 980190963, owner: nil, admin: nil>
  end
end
