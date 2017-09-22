require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem Ipsum")
  end

  test "micropost should be valid" do
    assert @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be minimum 140 characters" do
    @micropost.content = "s"*141
    assert_not @micropost.valid?
  end
  test "content should not be blank" do
    @micropost.content = "    "
    assert_not @micropost.valid?
  end
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
