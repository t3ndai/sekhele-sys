require "test_helper"

class PerformanceReviewQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_review_question = performance_review_questions(:one)
  end

  test "should get index" do
    get performance_review_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_performance_review_question_url
    assert_response :success
  end

  test "should create performance_review_question" do
    assert_difference("PerformanceReviewQuestion.count") do
      post performance_review_questions_url, params: { performance_review_question: { performance_review_type_id: @performance_review_question.performance_review_type_id, title: @performance_review_question.title } }
    end

    assert_redirected_to performance_review_question_url(PerformanceReviewQuestion.last)
  end

  test "should show performance_review_question" do
    get performance_review_question_url(@performance_review_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_performance_review_question_url(@performance_review_question)
    assert_response :success
  end

  test "should update performance_review_question" do
    patch performance_review_question_url(@performance_review_question), params: { performance_review_question: { performance_review_type_id: @performance_review_question.performance_review_type_id, title: @performance_review_question.title } }
    assert_redirected_to performance_review_question_url(@performance_review_question)
  end

  test "should destroy performance_review_question" do
    assert_difference("PerformanceReviewQuestion.count", -1) do
      delete performance_review_question_url(@performance_review_question)
    end

    assert_redirected_to performance_review_questions_url
  end
end
