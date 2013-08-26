require 'sinatra/base'
require './todo'
require 'sinatra/twitter-bootstrap'
require './url_helpers'

Todo.create(title: "Buy Milk", notes: "make sure to buy 2%")
Todo.create(title: "Buy Mark's Books", notes: "http://books.markbates.com")
Todo.create(title: "Cut the grass")

class TodoApp < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets

  helpers UrlHelpers

  get "/" do
    redirect todos_path
  end

  get "/todos" do
    @todos = Todo.all
    erb :index
  end

  get "/todos/new" do
    @todo = Todo.new
    erb :form
  end

  get "/todos/:id" do
    @todo = Todo.find(params[:id])
    redirect edit_todo_path(@todo)
  end

  get "/todos/:id/edit" do
    @todo = Todo.find(params[:id])
    erb :form
  end

  post "/todos" do
    Todo.create(params[:todo])
    redirect todos_path
  end

  put "/todos/:id" do
    @todo = Todo.find(params[:id])
    @todo.update_attributes(params[:todo])
    redirect todos_path
  end

  delete "/todos/:id" do
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect todos_path
  end

end

use Rack::MethodOverride

run TodoApp





