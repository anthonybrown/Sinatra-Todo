module UrlHelpers
  
  def new_todo_path
    "/todos/new"
  end
  
  def todo_path(todo)
    "/todos/#{todo.id}"
  end

  def edit_todo_path(todo)
    "/todos/#{todo.id}/edit"
  end

  def todos_path
    "/todos"
  end

  def link_to(text, path, options = {})
    %Q{<a href="#{path}" class="#{options[:class]}" data-method='#{options[:method]}'>#{text}</a>}
  end
  
end
