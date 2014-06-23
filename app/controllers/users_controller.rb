class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_sysadmin, :add_to_team, :remove_from_team]
  
  #Este filtro de abajo chequea que el usuario actual no sea nulo, es decir, que haya un usuario logueado
  # Meter en el only las acciones que tengan que verificar esto.
  before_action :current_user_nil_check, only: [:current_user_admin_check, :show] 

  # Filtro: verifica que sea administrador. Incluir las acciones que necesitan permisos de admin. Incluye revisar nulo
  before_action :current_user_admin_check, only: [:set_sysadmins, :index, :create_user_admin] 

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  #GET no id
  def create_user_admin
    @user = User.new
  end

  #POST
  def register_new_user
    @user = User.new(user_params)
    @user.isadmin = false #el usuario comienza no siendo sisadmin por default
    respond_to do |format|
      if @user.save
        format.html { redirect_to current_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to create_user_admin_path}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end  
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @projects = Project.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/set_sysadmins
  def set_sysadmins #para configurar los que van a ser sysadmins
          @users = User.all #obtiene todos los usuarios
      

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.isadmin = false #el usuario comienza no siendo sisadmin por default
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #POST user/:id/add_to_team
  def add_to_team
    @flags = {}
    @project = Project.find(params[:project_id])
  end

  #POST user/:id/remove_from_team
  #params -> project_id, id, type (SM, PO, DEV)
  def remove_from_team
    @project = Project.find(params[:project_id])
    if (params[:type].eql? "SM")
        @project.scrum_masters.delete(@user)
    end
    if (params[:type].eql? "DEV") 
        @project.users.delete(@user)
    end
    if (params[:type].eql? "PO") 
        @project.product_owners.delete(@user)
    end 
    redirect_to show_team_path(@project)
  end

  # POST /user/:id
  def toggle_sysadmin #hace el toggle de si un usuario es sisadmin o no
    #en @user esta el usuario

      if (@user.isadmin==true)
        @user.isadmin = false
      else
        @user.isadmin = true
      end #if
      if (@user.isadmin.nil?)
        @user.isadmin = true
      end #if
        @user.save
        puts @user.inspect
        redirect_to :action => "set_sysadmins"
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :encrypted_password)
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
