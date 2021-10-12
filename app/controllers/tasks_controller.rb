class TasksController < ApplicationController
    before_action :let_category
    before_action :let_task, only: [:show, :edit, :update, :destroy]

    def index
        redirect_to @category
    end

    def show
    end

    def new
        @task = @category.tasks.new
    end
    
    def create
        @task = @category.tasks.new(task_params)

        if @task.save
            redirect_to category_path(@category)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to category_path(@category)
    end

    private
        def task_params
            params.require(:task).permit(:title, :details, :date, :status)
        end

        def let_category
            @category = Category.find(params[:category_id])
        end

        def let_task
            @task = @category.tasks.find(params[:id])
        end
    end
