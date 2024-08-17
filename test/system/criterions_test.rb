require "application_system_test_case"

class CriterionsTest < ApplicationSystemTestCase
  setup do
    @criterion = criterions(:one)
  end

  test "visiting the index" do
    visit criterions_url
    assert_selector "h1", text: "Criterions"
  end

  test "should create criterion" do
    visit criterions_url
    click_on "New criterion"

    fill_in "Title", with: @criterion.title
    click_on "Create Criterion"

    assert_text "Criterion was successfully created"
    click_on "Back"
  end

  test "should update Criterion" do
    visit criterion_url(@criterion)
    click_on "Edit this criterion", match: :first

    fill_in "Title", with: @criterion.title
    click_on "Update Criterion"

    assert_text "Criterion was successfully updated"
    click_on "Back"
  end

  test "should destroy Criterion" do
    visit criterion_url(@criterion)
    click_on "Destroy this criterion", match: :first

    assert_text "Criterion was successfully destroyed"
  end
end
