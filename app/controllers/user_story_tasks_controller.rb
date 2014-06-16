class UserStoryTasksController < ApplicationController
  before_action :set_user_story_task, only: [:show, :edit, :update, :destroy]

  # GET /user_story_tasks
  # GET /user_story_tasks.json
  def index
    @user_story_tasks = UserStoryTask.all
  end

  # GET /user_story_tasks/1
  # GET /user_story_tasks/1.json
  def show
  end

  # GET /user_story_tasks/new
  def new
    @user_story_task = UserStoryTask.new
  end

  # GET /user_story_tasks/1/edit
  def edit
  end

  # POST /user_story_tasks
  # POST /user_story_tasks.json
  def create
    @user_story_task = UserStoryTask.new(user_story_task_params)

    respond_to do |format|
      if @user_story_task.save
        format.html { redirect_to @user_story_task, notice: 'User story task was successfully created.' }
        format.json { render :show, status: :created, location: @user_story_task }
      else
        format.html { render :new }
        format.json { render json: @user_story_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_story_tasks/1
  # PATCH/PUT /user_story_tasks/1.json
  def update
    respond_to do |format|
      if @user_story_task.update(user_story_task_params)
        format.html { redirect_to @user_story_task, notice: 'User story task was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story_task }
      else
        format.html { render :edit }
        format.json { render json: @user_story_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_story_tasks/1
  # DELETE /user_story_tasks/1.json
  def destroy
    @user_story_task.destroy
    respond_to do |format|
      format.html { redirect_to user_story_tasks_url, notice: 'User story task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story_task
      @user_story_task = UserStoryTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_task_params
      params.require(:user_story_task).permit(:description, :user_story_id, :stimated_effort_in_hours, :actual_effort_in_hours)
    end
end
