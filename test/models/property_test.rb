require "test_helper"

class PropertyTest < ActiveSupport::TestCase

  test "should be invalid without title" do
    property = properties(:one)
    property.title = nil
    assert_not property.valid?
  end

  test "should be invalid without address_line1" do
    property = properties(:one)
    property.address_line1 = nil
    assert_not property.valid?
  end

  test "should be invalid without city" do
    property = properties(:one)
    property.city = nil
    assert_not property.valid?
  end

  test "should be invalid without zip" do
    property = properties(:one)
    property.zip = nil
    assert_not property.valid?
  end

  test "should be valid" do
    property = properties(:one)
    assert property.valid?
  end

  test 'should return the display address' do
    property = properties(:one)
    assert_equal property.display_address, "#{property.address_line1}, #{property.city}"
  end

end
