require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'a project with no tasks is done' do
    project = Project.new
    assert(project.done?)
  end
end