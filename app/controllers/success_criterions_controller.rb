class SuccessCriterionsController < ApplicationController
  before_action :set_success_criterion, only: [:show, :edit, :update, :destroy, :toggle_completed]

  # GET /success_criterions
  # GET /success_criterions.json
  def index
    @success_criterions = SuccessCriterion.all
  end

  # GET /success_criterions/1
  # GET /success_criterions/1.json
  def show
  end

  #POTS /success_criterions/:id/toggle_completed
  def toggle_completed
    if @success_criterion.completed
       @success_criterion.completed = false
    else
      @success_criterion.completed = true
    end
    @success_criterion.save
    redirect_to crits_path(@success_criterion.user_story)
  end

  # GET /success_criterions/new
  def new
    @success_criterion = SuccessCriterion.new
    @user_story = UserStory.find(params[:user_story_id])
    @success_criterion.user_story = @user_story
  end

  # GET /success_criterions/1/edit
  def edit
  end

  # POST /success_criterions
  # POST /success_criterions.json
  def create
    @success_criterion = SuccessCriterion.new(success_criterion_params)

    respond_to do |format|
      if @success_criterion.save
        format.html { redirect_to crits_path(@success_criterion.user_story), notice: 'Success criterion was successfully created.' }
        format.json { render :show, status: :created, location: @success_criterion }
      else
        format.html { render :new }
        format.json { render json: @success_criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /success_criterions/1
  # PATCH/PUT /success_criterions/1.json
  def update
    respond_to do |format|
      if @success_criterion.update(success_criterion_params)
        format.html { redirect_to crits_path(@success_criterion.user_story), notice: 'Success criterion was successfully updated.' }
        format.json { render :show, status: :ok, location: @success_criterion }
      else
        format.html { render :edit }
        format.json { render json: @success_criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /success_criterions/1
  # DELETE /success_criterions/1.json
  def destroy
    @story = @success_criterion.user_story
    @success_criterion.destroy
    respond_to do |format|
      format.html { redirect_to crits_path(@story), notice: 'Success criterion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_success_criterion
      @success_criterion = SuccessCriterion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def success_criterion_params
      params.require(:success_criterion).permit(:description, :completed, :user_story_id)
    end
end
