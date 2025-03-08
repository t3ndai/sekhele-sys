require "application_system_test_case"

class PerformanceReviewQuestionsTest < ApplicationSystemTestCase
  setup do
    @performance_review_question = performance_review_questions(:one)
  end

  test "visiting the index" do
    visit performance_review_questions_url
    assert_selector "h1", text: "Performance review questions"
  end

  test "should create performance review question" do
    visit performance_review_questions_url
    click_on "New performance review question"

    fill_in "Performance review type", with: @performance_review_question.performance_review_type_id
    fill_in "Title", with: @performance_review_question.title
    click_on "Create Performance review question"

    assert_text "Performance review question was successfully created"
    click_on "Back"
  end

  test "should update Performance review question" do
    visit performance_review_question_url(@performance_review_question)
    click_on "Edit this performance review question", match: :first

    fill_in "Performance review type", with: @performance_review_question.performance_review_type_id
    fill_in "Title", with: @performance_review_question.title
    click_on "Update Performance review question"

    assert_text "Performance review question was successfully updated"
    click_on "Back"
  end

  test "should destroy Performance review question" do
    visit performance_review_question_url(@performance_review_question)
    click_on "Destroy this performance review question", match: :first

    assert_text "Performance review question was successfully destroyed"
  end
end
