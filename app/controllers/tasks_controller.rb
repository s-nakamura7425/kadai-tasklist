class TasksController < ApplicationController
  before_action :set_task ,only: [:show, :edit, :update, :destroy] 
    
  def index
    @tasks = Task.all
  end

  def show
  end
  
  def new
    @task = Task.new
  end
    
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが正常に登録されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが登録されませんでした"
      render:new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "Taskが正常に登録されました"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが登録されませんでした"
      render:edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "Taskは削除されました"
    redirect_to tasks_url
  end
  
  private

  def task_params
    params.require(:task).permit(:status, :content)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end