require 'test_helper'

class UserStoryTasksControllerTest < ActionController::TestCase
  setup do
    @user_story_task = user_story_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_story_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_story_task" do
    assert_difference('UserStoryTask.count') do
      post :create, user_story_task: { actual_effort_in_hours: @user_story_task.actual_effort_in_hours, description: @user_story_task.description, stimated_effort_in_hours: @user_story_task.stimated_effort_in_hours, user_story_id: @user_story_task.user_story_id }
    end

    assert_redirected_to user_story_task_path(assigns(:user_story_task))
  end

  test "should show user_story_task" do
    get :show, id: @user_story_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_story_task
    assert_response :success
  end

  test "should update user_story_task" do
    patch :update, id: @user_story_task, user_story_task: { actual_effort_in_hours: @user_story_task.actual_effort_in_hours, description: @user_story_task.description, stimated_effort_in_hours: @user_story_task.stimated_effort_in_hours, user_story_id: @user_story_task.user_story_id }
    assert_redirected_to user_story_task_path(assigns(:user_story_task))
  end

  test "should destroy user_story_task" do
    assert_difference('UserStoryTask.count', -1) do
      delete :destroy, id: @user_story_task
    end

    assert_redirected_to user_story_tasks_path
  end
end
