require "application_system_test_case"

class ReceptTypesTest < ApplicationSystemTestCase
  setup do
    @recept_type = recept_types(:one)
  end

  test "visiting the index" do
    visit recept_types_url
    assert_selector "h1", text: "Recept Types"
  end

  test "creating a Recept type" do
    visit recept_types_url
    click_on "New Recept Type"

    fill_in "Name", with: @recept_type.name
    click_on "Create Recept type"

    assert_text "Recept type was successfully created"
    click_on "Back"
  end

  test "updating a Recept type" do
    visit recept_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @recept_type.name
    click_on "Update Recept type"

    assert_text "Recept type was successfully updated"
    click_on "Back"
  end

  test "destroying a Recept type" do
    visit recept_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recept type was successfully destroyed"
  end
end
