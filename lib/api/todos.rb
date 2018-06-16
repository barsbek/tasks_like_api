module TasksLike
  class Todos < Grape::API
    cattr_accessor :todos, :id

    resource :todos do
      get do
        Todos.todos
      end

      params { requires :text, type: String }
      post do
        todo = { id: TasksLike::Todos.id += 1, text: params[:text] }
        Todos.todos << todo
        todo
      end

      route_param :id do
        get do
          Todos.todos.find {|t| t[:id] == params[:id].to_i }
        end

        params { requires :text, type: String }
        put do
          todo = Todos.todos.find{ |t| t[:id] == params[:id].to_i }
          todo[:text] = params[:text]
          todo
        end

        delete do
          todo = Todos.todos.find{ |t| t[:id] == params[:id].to_i }
          Todos.todos.reject!{ |t| t[:id] == params[:id].to_i }
          todo
        end
      end
    end
  end
end

TasksLike::Todos.id = 0
TasksLike::Todos.todos = [
  { id: TasksLike::Todos.id += 1, text: 'some info' },
  { id: TasksLike::Todos.id += 1, text: 'another task' }
];
