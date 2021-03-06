class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
 @search=Task.search(params[:q])
 if params[:q]
 @tasks=@search.result.order(:name).page(params[:page]).per(2)
 elsif params[:sort_with]
   @tasks = Task.all.order("priority DESC").order(:name).page(params[:page]).per(2)
  elsif  params[:key]
    @tasks = Task.joins(:labels)
    .where("labels.title LIKE ?", "%#{params[:key]}%").page(params[:page])

 else
 @tasks = Task.all.order("created_at DESC").order(:name).page(params[:page]).per(2)
  end
end
  def show
  end
  def new
    @task = Task.new
  end
  def edit
  end
  def create
    @task = Task.new(task_params)
    @task.user_id == current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:name, :details,:start,:enddate,:status,:priority,:user_id,:key, label_ids:[])
    end
end
