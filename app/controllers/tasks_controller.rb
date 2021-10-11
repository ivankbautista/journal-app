class TasksController < ApplicationController

    def index
        redirect_to @category
    end

    def show
    end

    def new
        @task = @category.tasks.new
    end
    
    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
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
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to categories_path(@category)
    end

    private
        def task_params
            params.require(:task).permit(:title, :details, :date, :status)
        end
    end