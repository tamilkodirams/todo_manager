class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{todo_text} #{is_completed} #{due_date.to_s(:long)}"
  end
end
