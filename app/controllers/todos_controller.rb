class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render "todos"
  end

  def create
    todo_text = params[:todo_text]
    due_date=params[:due_date].to_s
    puts due_date
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )

    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    users = Todo.destroy(id)
    redirect_to todos_path
  end
end
