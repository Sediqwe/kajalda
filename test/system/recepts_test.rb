require "application_system_test_case"

class ReceptsTest < ApplicationSystemTestCase
  setup do
    @recept = recepts(:one)
  end

  test "visiting the index" do
    visit recepts_url
    assert_selector "h1", text: "Recepts"
  end

  test "creating a Recept" do
    visit recepts_url
    click_on "New Recept"

    fill_in "Name", with: @recept.name
    fill_in "Recept type", with: @recept.recept_type_id
    click_on "Create Recept"

    assert_text "Recept was successfully created"
    click_on "Back"
  end

  test "updating a Recept" do
    visit recepts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @recept.name
    fill_in "Recept type", with: @recept.recept_type_id
    click_on "Update Recept"

    assert_text "Recept was successfully updated"
    click_on "Back"
  end

  test "destroying a Recept" do
    visit recepts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recept was successfully destroyed"
  end
end
