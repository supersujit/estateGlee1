require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "should create property" do
    visit properties_url
    click_on "New property"

    fill_in "Address line1", with: @property.address_line1
    fill_in "Address line2", with: @property.address_line2
    fill_in "City", with: @property.city
    fill_in "Description", with: @property.description
    fill_in "Picture url", with: @property.picture_url
    fill_in "Status", with: @property.status
    fill_in "Title", with: @property.title
    fill_in "Zip", with: @property.zip
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "should update Property" do
    visit property_url(@property)
    click_on "Edit this property", match: :first

    fill_in "Address line1", with: @property.address_line1
    fill_in "Address line2", with: @property.address_line2
    fill_in "City", with: @property.city
    fill_in "Description", with: @property.description
    fill_in "Picture url", with: @property.picture_url
    fill_in "Status", with: @property.status
    fill_in "Title", with: @property.title
    fill_in "Zip", with: @property.zip
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "should destroy Property" do
    visit property_url(@property)
    click_on "Destroy this property", match: :first

    assert_text "Property was successfully destroyed"
  end
end
