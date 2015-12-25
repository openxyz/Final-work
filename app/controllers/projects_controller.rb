class ProjectsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :user_params

  def index
    @projects = Project.all
  end

  def show

  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: "Successfully created project."
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: "Successfully updated project."
    else
      render 'edit'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
  def find_params
    @project = Project.find(params[:id])
  end
  def user_params
    @user = current_user
  end
end
