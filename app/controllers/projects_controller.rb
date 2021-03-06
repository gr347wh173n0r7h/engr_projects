class ProjectsController < ApplicationController
  def index
    if logged_in?
      @projects = Project.order("id").all
    elsif
    redirect_to login_path
    end
  end

  def show
    if logged_in?
      @project = Project.find(params[:id])
      @leader = User.find(@project.leader_id)
      @team = Team.where(project_id: @project.id, user_id: current_user.id).take
    elsif
    redirect_to login_path
    end
  end

  def new
    @type = Type.all
  end

  def create
    if !Project.where(leader_id: current_user.id).take
      if !Team.where(user_id: current_user.id).take
        @user = current_user
        @project = Project.new(project_params)
        @project[:leader_id] = current_user.id
        @project[:num_people] = 1
        @project.teams.build(project_id: @project.id, user_id: @user.id)
        if @project.save
            flash[:danger] = 'Project Created'
            redirect_to project_path(@project)
        else
          flash[:failure] = "Error Occured"
          render 'new'
        end
      else
        flash[:failure] = "You are already in a team!"
        redirect_to :back
      end
    else
      flash[:failure] = "You have already created a project!"
      redirect_to projects_path
    end
  end

  def edit
    @project = Project.find(params[:id])
    @type = Type.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:danger] = 'Project Updated'
      redirect_to project_path(@project)
    else
      flash[:failure] = "Error Occured"
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.teams.destroy_all
    @project.destroy
    flash[:danger] = 'Project Deleted'
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :sub_title, :desc, :type_id, :skills)
  end

end
