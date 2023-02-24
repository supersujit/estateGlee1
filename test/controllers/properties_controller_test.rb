require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @property = properties(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference("Property.count") do
      post properties_url, params: { property: { address_line1: @property.address_line1, address_line2: @property.address_line2, city: @property.city, description: @property.description, picture_url: @property.picture_url, title: @property.title, zip: @property.zip } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address_line1: @property.address_line1, address_line2: @property.address_line2, city: @property.city, description: @property.description, picture_url: @property.picture_url, title: @property.title, zip: @property.zip } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference("Property.count", -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end

  test 'should get the property comments' do
    get get_property_comments_url(@property)
    assert_response :success
  end

  test 'should create a comment' do
    assert_difference("Comment.count") do
      post create_property_comments_url(@property), params: { title: 'foo title', body: 'bar body' }
    end
    created_comment = Comment.last
    assert_equal 'foo title', created_comment.title
    assert_equal 'bar body', created_comment.body
    assert_equal @user.id, created_comment.user_id
    assert_equal @property.id, created_comment.property_id
  end
end
