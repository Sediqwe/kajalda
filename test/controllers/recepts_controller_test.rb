require 'test_helper'

class ReceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recept = recepts(:one)
  end

  test "should get index" do
    get recepts_url
    assert_response :success
  end

  test "should get new" do
    get new_recept_url
    assert_response :success
  end

  test "should create recept" do
    assert_difference('Recept.count') do
      post recepts_url, params: { recept: { name: @recept.name, recept_type_id: @recept.recept_type_id } }
    end

    assert_redirected_to recept_url(Recept.last)
  end

  test "should show recept" do
    get recept_url(@recept)
    assert_response :success
  end

  test "should get edit" do
    get edit_recept_url(@recept)
    assert_response :success
  end

  test "should update recept" do
    patch recept_url(@recept), params: { recept: { name: @recept.name, recept_type_id: @recept.recept_type_id } }
    assert_redirected_to recept_url(@recept)
  end

  test "should destroy recept" do
    assert_difference('Recept.count', -1) do
      delete recept_url(@recept)
    end

    assert_redirected_to recepts_url
  end
end
