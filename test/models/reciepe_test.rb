require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "jhon", email: "jhon@example.com")

    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is best recipe for chicken", description: "Maecenas vestibulum mollis diam. Vivamus elementum semper nisi.")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be to long" do
    @recipe.name = "a" * 55
    assert_not @recipe.valid?
  end

  test "name length should not be to short" do
    @recipe.name = "a"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary length should not be to long" do
    @recipe.summary = "a" * 155
    assert_not @recipe.valid?
  end

  test "summary length should not be to short" do
    @recipe.summary = "a"
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description length should not be to short" do
    @recipe.description = "a"
    assert_not @recipe.valid?
  end
end
