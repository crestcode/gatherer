require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test 'a completed task is complete' do
    task = Task.new
    refute(task.complete?)
    task.complete!
    assert(task.complete?)
  end

  test 'an uncompleted task does not count toward velocity' do
    task = Task.new(size: 3)
    refute(task.counts_toward_velocity?)
    assert_equal(0, task.points_toward_velocity)
  end

  test 'a task completed long ago does not count toward velocity' do
    task = Task.new(size: 3)
    task.complete!(6.months.ago)
    refute(task.counts_toward_velocity?)
    assert_equal(0, task.points_toward_velocity)
  end

  test 'a task completed recently counts toward velocity' do
    task = Task.new(size: 3)
    task.complete!(1.day.ago)
    assert(task.counts_toward_velocity?)
    assert_equal(3, task.points_toward_velocity)
  end
end