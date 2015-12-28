class ProjectsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.order(cached_votes_total: :desc)
    @perfect = Project.order(cached_votes_total: :desc).take(4)
  end

  def show
  end

  def new
    @project = current_user.projects.build
    render :new, layout: false
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      path = @project.zip.path
      dir = @project.user.stuId
      if system("mkdir -p ./public/demo/#{dir}") && system("unzip -o #{path} -d ./public/demo/#{dir}")
        redirect_to @project, notice: "文件上传成功。"
      else
        @project.errors[:zip] = "文件上传失败。"
        render 'new', layout: false
      end
    else
      @project.errors[:base] = "文件上传失败。"
      render :new, layout: false
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: "修改完成"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  def upvote
    @project.upvote_by current_user
    redirect_to :back
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :image, :zip)
  end
  def find_params
    @project = Project.find(params[:id])
  end
end
