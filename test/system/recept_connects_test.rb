require "application_system_test_case"

class ReceptConnectsTest < ApplicationSystemTestCase
  setup do
    @recept_connect = recept_connects(:one)
  end

  test "visiting the index" do
    visit recept_connects_url
    assert_selector "h1", text: "Recept Connects"
  end

  test "creating a Recept connect" do
    visit recept_connects_url
    click_on "New Recept Connect"

    fill_in "Material", with: @recept_connect.material_id
    fill_in "Recept", with: @recept_connect.recept_id
    fill_in "Size", with: @recept_connect.size_id
    click_on "Create Recept connect"

    assert_text "Recept connect was successfully created"
    click_on "Back"
  end

  test "updating a Recept connect" do
    visit recept_connects_url
    click_on "Edit", match: :first

    fill_in "Material", with: @recept_connect.material_id
    fill_in "Recept", with: @recept_connect.recept_id
    fill_in "Size", with: @recept_connect.size_id
    click_on "Update Recept connect"

    assert_text "Recept connect was successfully updated"
    click_on "Back"
  end

  test "destroying a Recept connect" do
    visit recept_connects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recept connect was successfully destroyed"
  end
end
