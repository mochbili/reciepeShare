require 'test_helper'

class ReciepeTest < ActiveSupport::TestCase

  def setup
    @reciepe = Reciepe.new(name: "chicken parm", summary: "this is best reciepe for chicken", description: "Maecenas vestibulum mollis diam. Vivamus elementum semper nisi.")
  end

  test "reciepe should be valid" do
    assert @reciepe.valid?
  end

  test "name should be present" do
    @reciepe.name = " "
    assert_not @reciepe.valid?
  end

  test "name length should not be to long" do
    @reciepe.name = "a" * 55
    assert_not @reciepe.valid?
  end

  test "name length should not be to short" do
    @reciepe.name = "a"
    assert_not @reciepe.valid?
  end

  test "summary should be present" do
    @reciepe.summary = " "
    assert_not @reciepe.valid?
  end

  test "summary length should not be to long" do
    @reciepe.summary = "a" * 155
    assert_not @reciepe.valid?
  end

  test "summary length should not be to short" do
    @reciepe.summary = "a"
    assert_not @reciepe.valid?
  end

  test "description should be present" do
    @reciepe.description = " "
    assert_not @reciepe.valid?
  end

  test "description length should not be to short" do
    @reciepe.description = "a"
    assert_not @reciepe.valid?
  end
end
