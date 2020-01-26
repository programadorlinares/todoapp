class TodosController < ApplicationController

  def new
    @todo=Todo.new
  end

  def create
    @todo=Todo.new(todo_params)
    if @todo.save
      flash[:notice]="The todo has been created successfully"
      redirect_to @todo
    else
      render 'new'
    end
  end


  def show
    @todo=Todo.find(params[:id])
  end

  def edit
    @todo=Todo.find(params[:id])
  end

  def update
    @todo=Todo.find(params[:id]) # es un todo
    if @todo.update(todo_params) # if sentence
      flash[:notice]="Todo was successfully update"  #flash comment
      redirect_to @todo
    else
      render 'edit'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
