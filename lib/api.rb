require_relative 'api/todos'

module TasksLike
  class API < Grape::API
    format :json

    mount ::TasksLike::Todos
  end
end
