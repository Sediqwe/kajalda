require 'test_helper'

class ReceptTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recept_type = recept_types(:one)
  end

  test "should get index" do
    get recept_types_url
    assert_response :success
  end

  test "should get new" do
    get new_recept_type_url
    assert_response :success
  end

  test "should create recept_type" do
    assert_difference('ReceptType.count') do
      post recept_types_url, params: { recept_type: { name: @recept_type.name } }
    end

    assert_redirected_to recept_type_url(ReceptType.last)
  end

  test "should show recept_type" do
    get recept_type_url(@recept_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_recept_type_url(@recept_type)
    assert_response :success
  end

  test "should update recept_type" do
    patch recept_type_url(@recept_type), params: { recept_type: { name: @recept_type.name } }
    assert_redirected_to recept_type_url(@recept_type)
  end

  test "should destroy recept_type" do
    assert_difference('ReceptType.count', -1) do
      delete recept_type_url(@recept_type)
    end

    assert_redirected_to recept_types_url
  end
end
