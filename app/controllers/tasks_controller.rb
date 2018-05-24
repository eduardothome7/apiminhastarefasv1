class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :play_pause, :update, :destroy]
  # before_action :autorize!

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = @user.tasks.where(user_id: @user.id)
    @tasks = Task.opened
    if params[:status] && params[:status] == "closed"
      @tasks = Task.closed
    end
  end

  def closed
    @tasks = @user.where(user_id: @user.id).closed
  end

  def team 
    @tasks = @user.tasks.where.not(user_id: @user.id)
  end

  def play_pause
    respond_to do |format|
      if @task.change
        format.json { render :show, status: :ok, location: @task }
      else
        @task.errors.add(
          :status_id,  
          message: "A tarefa deve estar aberta"
        )
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.user_id = User.first.id
    @task.status_id = Status.first.id
    @task.project_id = Project.first.id
    @task.category_id = Category.first.id
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

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

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
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

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def autorize!
      if !session[:session_user]
        redirect_to new_session_path 
      else 
        # session = Session.find_by(id: session[:session_user])
        @user = User.first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.fetch(:task, {}).permit(:title, :project_id, :category_id, :status_id, :user_id, :start_at, :estimate_at, :closed_at, :description, :priority, :estimate_min)
    end
end
