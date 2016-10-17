require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "john", email: "example@nowhare.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chefname should not be to long" do
    @chef.chefname = "a" * 45
    assert_not @chef.valid?
  end

  test "chefname should not be to short" do
    @chef.chefname = "a"
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email length should be within bounds" do
    @chef.email = "a" * 50 + "@nowhare.com"
    assert_not @chef.valid?
  end

  test "email should be unique" do
    local_chef = @chef.dup
    local_chef.email = @chef.email.upcase
    @chef.save
    assert_not local_chef.valid?
  end

  test "email should be valid format" do
    valid_email = %w[user@example.com R_TDD-DS@hello.org example@nowhare.com first.last@eem.au laura+joe@monk.cm]
    valid_email.each do |ve|
      @chef.email = ve
      assert @chef.valid?, "#{ve.inspect} chould be valid"
    end
  end

  test "email should be invalid format" do
    invalid_email = %w[user@example_com user_at_eee.org user.name@nowhare eee@i_am_.com foo@eee+aar.com]
    invalid_email.each do |ie|
      @chef.email = ie
      assert_not @chef.valid?, "#{ie.inspect} chould not be valid"
    end
  end
end
