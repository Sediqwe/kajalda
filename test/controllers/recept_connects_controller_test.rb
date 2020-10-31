require 'test_helper'

class ReceptConnectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recept_connect = recept_connects(:one)
  end

  test "should get index" do
    get recept_connects_url
    assert_response :success
  end

  test "should get new" do
    get new_recept_connect_url
    assert_response :success
  end

  test "should create recept_connect" do
    assert_difference('ReceptConnect.count') do
      post recept_connects_url, params: { recept_connect: { material_id: @recept_connect.material_id, recept_id: @recept_connect.recept_id, size_id: @recept_connect.size_id } }
    end

    assert_redirected_to recept_connect_url(ReceptConnect.last)
  end

  test "should show recept_connect" do
    get recept_connect_url(@recept_connect)
    assert_response :success
  end

  test "should get edit" do
    get edit_recept_connect_url(@recept_connect)
    assert_response :success
  end

  test "should update recept_connect" do
    patch recept_connect_url(@recept_connect), params: { recept_connect: { material_id: @recept_connect.material_id, recept_id: @recept_connect.recept_id, size_id: @recept_connect.size_id } }
    assert_redirected_to recept_connect_url(@recept_connect)
  end

  test "should destroy recept_connect" do
    assert_difference('ReceptConnect.count', -1) do
      delete recept_connect_url(@recept_connect)
    end

    assert_redirected_to recept_connects_url
  end
end
