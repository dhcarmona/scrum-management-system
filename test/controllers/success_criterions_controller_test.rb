require 'test_helper'

class SuccessCriterionsControllerTest < ActionController::TestCase
  setup do
    @success_criterion = success_criterions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:success_criterions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create success_criterion" do
    assert_difference('SuccessCriterion.count') do
      post :create, success_criterion: { completed: @success_criterion.completed, description: @success_criterion.description, user_story_task_id: @success_criterion.user_story_task_id }
    end

    assert_redirected_to success_criterion_path(assigns(:success_criterion))
  end

  test "should show success_criterion" do
    get :show, id: @success_criterion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @success_criterion
    assert_response :success
  end

  test "should update success_criterion" do
    patch :update, id: @success_criterion, success_criterion: { completed: @success_criterion.completed, description: @success_criterion.description, user_story_task_id: @success_criterion.user_story_task_id }
    assert_redirected_to success_criterion_path(assigns(:success_criterion))
  end

  test "should destroy success_criterion" do
    assert_difference('SuccessCriterion.count', -1) do
      delete :destroy, id: @success_criterion
    end

    assert_redirected_to success_criterions_path
  end
end
