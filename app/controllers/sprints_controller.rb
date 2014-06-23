class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy, :user_stories_for_sprint_master, :get_burndown_chart,
                                      :get_chart_hours, :get_chart_points]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.all
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
    @release = Release.find(params[:release_id])
    @sprint.release = @release
  end

  # GET 
  def get_burndown_chart

  end

  # GET 
  def get_chart_points
    if !@sprint.release.project.scrum_masters.include? current_user
      redirect_to root_path
    else
        @chart = LazyHighCharts::HighChart.new("graph") do |f|
          f.title(:text => "Points Burndown Chart for Project " + @sprint.release.project.name)
          f.options[:xAxis][:categories] = []
          points = []
          total_points = @sprint.total_stimated_points
          points << total_points
          current_date = @sprint.created_at.to_date
          f.options[:xAxis][:categories] << current_date
          current_date += 1.day    
          while current_date != (DateTime.now.to_date+1.day) do #por cada dia
            points_this_day = 0
            @sprint.user_stories.each do |story| #por cada story
                  date_completed = story.created_at.to_date
                  tasks_completed= 0
                  story.user_story_tasks.each do |task| #por cada task
                      if task.stimated_effort_in_hours == task.actual_effort_in_hours #si el task esta completo
                        tasks_completed += 1 #apuntar que se completo
                      end
                      if tasks_completed == story.user_story_tasks.count #si, en ese dia, estan completadas todas las tareas de ese story
                          if story.added_times.first(:order => 'created_at DESC').to_date == current_date #si hoy es el dia en que se termino el story
                             points_this_day = story.points #hoy se lograron los puntos del story 
                          end 
                            
                        
                      end
                  end

            end
            total_points -= points_this_day
            points << total_points
            f.options[:xAxis][:categories] << current_date
            current_date += 1.day      
          end
          f.series(:name => "Points Left", :yAxis => 0, :data => points)

          f.yAxis [{:title => {:text => "Points Remaining", :min => 0}},
          ]

          f.legend(:align => "right", :verticalAlign => "top", :y => 75, :x => -50, :layout => "vertical")
          f.chart({:defaultSeriesType => "column"})
        end
        render "burndown_chart"
    end
  end

  # GET 
  def get_chart_hours
    if !@sprint.release.project.scrum_masters.include? current_user
      redirect_to root_path
    else
        @chart = LazyHighCharts::HighChart.new("graph") do |f|
          f.title(:text => "Hours Burndown Chart for Project " + @sprint.release.project.name)
          f.options[:xAxis][:categories] = []
          hours = []
          total_hours = @sprint.total_stimated_hours_of_work
          hours << total_hours
          current_date = @sprint.created_at.to_date
          f.options[:xAxis][:categories] << current_date
          current_date += 1.day    
          cont_prueba = 0 
          while current_date != (DateTime.now.to_date+1.day) do
            hours_this_day = 0
            @sprint.user_stories.each do |story|
                  story.user_story_tasks.each do |task|
                    task.added_times.each do |added_time|
                      if added_time.datetime.to_date == current_date
                        hours_this_day += added_time.hours
                      end
                    end
                  end
            end
            total_hours -= hours_this_day
            hours << total_hours
            f.options[:xAxis][:categories] << current_date
            current_date += 1.day      

          end
          f.series(:name => "Hours Left", :yAxis => 0, :data => hours)

          f.yAxis [{:title => {:text => "Hours of Effort Remaining", :min => 0}},
          ]

          f.legend(:align => "right", :verticalAlign => "top", :y => 75, :x => -50, :layout => "vertical")
          f.chart({:defaultSeriesType => "column"})
        end
        render "burndown_chart"
    end
  end

  #GET /sprints/:id/user_stories_for_sprint_master
  def user_stories_for_sprint_master
    @user_stories = @sprint.user_stories
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to @sprint, notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to @sprint, notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to sprints_url, notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:release_id, :sprint_review)
    end
end
