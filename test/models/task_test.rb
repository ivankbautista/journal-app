require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @user = users(:ivan)
  end

  test 'should not save Task without title' do
    category = @user.categories.create(title: "School")
    task = category.tasks.create(title: nil)

    assert_not task.save, "saved task without title"
  end

  test "" do
    # setup
    # exercise
    # verify
  end
end
