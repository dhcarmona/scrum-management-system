class ProjectsController < ApplicationController

  #Esta linea de abajo es un filtro. Los filtros son metodos que se llaman antes o despues de ciertas cosas.
  # Esta en particular dice que se va a llamar al metodo :set_project, antes de ejecutar las acciones
  # :show, :edit, :update, :destroy. El metodo :set_project está en lo más abajo del archivo.
<<<<<<< HEAD
  before_action :set_project, only: [:show, :edit, :update, :destroy, 
                                     :show_team, :user_stories_owner, 
                                     :releases_owner, :add_to_team, :user_stories_master,
                                     :releases_master, :user_stories_dev, :get_report]
=======
  before_action :set_project, only: [:show, :edit, :update, :destroy, :show_team, :user_stories_owner, :releases_owner, :add_to_team]
>>>>>>> 83fca7697e987beafd37690dc44103de03a0df1a

  before_action :current_user_nil_check, only: [:show, :user_stories_dev] 

  # Filtro: verifica que sea administrador. Incluir las acciones que necesitan permisos de admin. Incluye revisar nulo
  before_action :current_user_admin_check, only: [:show_team] 

# Flujo usual de un controlador:
# - El usuario inserta la ruta a la que quiere ir, o llega a ella por un boton o enlace.
# - El servidor revisa a que acción de cuál controlador corresponde esa ruta, lo hace viendo el archivo config/routes.rb
# - El servidor ejecuta la acción del controlador.
# - El controlador hace lo que dice la acción y al final muestra la vista que se llama igual que la acción,
#     - Por ejemplo, si la acción se llama index, el controlador muestra la vista index.html.erb, en su carpeta de views.
# - El controlador le pasa información a la vista por variables que empiezan con @.
# - Luego, el usuario usa la visa, pone la info, y la vista le responde a algun controlador (puede no ser el mismo),
#   - con algun metodo HTTP, como GET o POST. Normalmente es GET para obtener algun dato o acciones que solo muestren info,
#   - y POST para acciones que modifiquen la base de datos o que necesiten seguridad adicional. Esto porque, en el caso de
#   - las acciones GET, los parámetros siempre se van por la URL y son visibles, en cambio en POST van empaquetados.



<<<<<<< HEAD
  # GET /projects/:id/get_report
  def get_report
    if !@project.scrum_masters.include? current_user
      redirect_to :controller => "misc", :action =>"about"
    else

      #obtener los burndown
      @charts = {}

      #por cada sprint
      @project.sprints.each do |sprint|


        charts_sprint = {}
        charts_sprint["points"] =  LazyHighCharts::HighChart.new("graph") do |f|
            f.title(:text => "Points Burndown Chart for Project " + sprint.release.project.name)
            f.options[:xAxis][:categories] = []
            f.options[:plotOptions][:column] = {:animation => :false}
            points = []
            total_points = sprint.total_stimated_points
            points << total_points
            current_date = sprint.created_at.to_date
            f.options[:xAxis][:categories] << current_date
            current_date += 1.day    
            while current_date != (DateTime.now.to_date+1.day) do #por cada dia
              points_this_day = 0
              sprint.user_stories.each do |story| #por cada story
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
            end #while
            f.series(:name => "Points Left", :yAxis => 0, :data => points)

            f.yAxis [{:title => {:text => "Points Remaining", :min => 0}},
            ]

            f.legend(:align => "right", :verticalAlign => "top", :y => 75, :x => -50, :layout => "vertical")
            f.chart({:defaultSeriesType => "column"})
          end #graph do

        charts_sprint["hours"] = LazyHighCharts::HighChart.new("graph") do |f|
              f.title(:text => "Hours Burndown Chart for Project " + sprint.release.project.name)
              f.options[:xAxis][:categories] = []
              f.options[:plotOptions][:column] = {:animation => :false}
              hours = []
              total_hours = sprint.total_stimated_hours_of_work
              hours << total_hours
              current_date = sprint.created_at.to_date
              f.options[:xAxis][:categories] << current_date
              current_date += 1.day    
              cont_prueba = 0 
              while current_date != (DateTime.now.to_date+1.day) do
                hours_this_day = 0
                sprint.user_stories.each do |story|
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
            end #graph do
        @charts[sprint.id] = charts_sprint #guarda el hash con los dos charts, para pasarlo al view
      end #each sprint
      render :pdf => "project", :template => "projects/show_pdf", :disable_javascript => false,
              :margin => {:top => 20,
                         :bottom  => 20,
                         :left  => 20, 
                         :right  => 20}, 
            :disable_smart_shrinking => false
    end
  end

=======
>>>>>>> 83fca7697e987beafd37690dc44103de03a0df1a
  # POST /projects/:id/add_to_team
  # params -> user_id, id, type (SM, PO, DEV)
  def add_to_team 
    @user = User.find(params[:user_id])
    if (params[:type].eql? "SM")
        @project.scrum_masters << @user
    end
    if (params[:type].eql? "DEV") 
        @project.users << @user
    end
    if (params[:type].eql? "PO") 
        @project.product_owners << @user      
    end 
    redirect_to show_team_path(@project)
  end

  # GET /projects
  # GET /projects.json
  def index 
    #Guarda en @projects todos los proyectos. Hay que cambiarlo para que sólo agarre los que pertenecen al usuario logeado.
    @projects = Project.all 
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #Este es un caso especial: el archivo routes establece que User es un recurso, así que cuando llega a la ruta del
    # proyecto, por ejemplo, /project/15, es el perfil del proyecto con id 15, entonces como es un recurso, el controlador
    # automáticamente carga el usuario en la variable @project, listo para la vista. Esto lo hace con el metodo :set_project
  end

  # GET /projects/:id/user_stories_master
  # Vista para mostrar los user stories del projecto a un master, debe mostrar la opción de asignar el user story a un developer.


  def user_stories_dev
    @user_stories = UserStory.where(:user_id => current_user.id)
  end



  # GET /projects/:id/releases_master
  # Vista para mostrar los releases del projecto a un master, debe mostrar la opción de asignar el user story a un developer.

  def releases_master
    if !@project.scrum_masters.include? current_user
      redirect_to root_path
    end
  end

  # GET /projects/:id/releases_owner
  def releases_owner
    if !@project.product_owners.include? current_user
      redirect_to root_path
    end
  end

  # GET /projects/:id/user_stories_master
  def user_stories_master
    if !@project.scrum_masters.include? current_user
      redirect_to root_path
    end
  end


  # GET /projects/:id/show_team
  def show_team

    @all_users = User.all
<<<<<<< HEAD

=======
>>>>>>> 83fca7697e987beafd37690dc44103de03a0df1a
  end

  # GET /projects/new
  def new
    #crea un nuevo proyecto para que la vista le rellene los datos. Cuando la vista vuelve, envía los datos al
    # la accion create, que es POST; como es POST no tiene vista asociada.
    @project = Project.new
    @users = User.all
  end

  # GET /projects/1/edit
  def edit
    @users = User.all
  end

  # POST /projects
  # POST /projects.json
  def create

    #Acá se retorna de la vista New (o de cualquier lugar que llame a create con POST). Le llega el hash project_params con 
    # los datos que retornó la vista.

    #Crea el nuevo usuario.
    @project = Project.new(project_params)

    respond_to do |format| #Esta linea es curiosa. Si el request le llegó por HTML, entonces fue un navegador. Si le llego
                           #por JSON, entonces probablemente fue otra cosa, un app movil por ejemplo.
      if @project.save #Esto guarda el proyecto nuevo en la base de datos y retorna True si no hubo problema, y False si hubo un error.
                      # Es importante notar que al llamar .save, primero pasa por el modelo, el cual revisa que no falte ningún dato.
                      # Por ejemplo, si el modelo necesita que se incluya el nombre del proyecto, si o si, y no se le pasó el nombre,
                      # Entonces el modelo va a guardar ese error en un hash llamado errors, dentro de el mismo (@projects.errors)
                      # y va a hacer que .save retorne False.


        format.html { redirect_to :controller => "misc", :action =>"about", notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to :controller => "misc", :action =>"about", notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to :controller => "misc", :action =>"about", notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id]) # Recupera el proyecto correspondiente al ID que le llego
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params

      #Esto es una lista blanca de parámetros, son los parametros que vamos a permitir que se le asignen en masa al modelo,
      # es decir haciendo por ejemplo Projects.new(params). Si el parametro no esta aca, entonces no se le va a asignar el
      # parametro.
      params.require(:project).permit(:name, :description, :product_owner_id, :scrum_master_id, :sprint_duration_in_weeks)
    end

    def current_user_nil_check
      if (current_user.nil?)
        redirect_to :controller => "misc", :action =>"about"
      end
    end

    def current_user_admin_check
      if (current_user.nil?)
        redirect_to :controller => "misc", :action =>"about"
      else 
        if !(current_user.isadmin)
        redirect_to :controller => "misc", :action =>"about"
        end
      end
    end

end
