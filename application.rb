require 'lotus'
require 'lotus/model'
require 'lotus/action/session'
module ToDoApp
  class Application < Lotus::Application
    configure do
      routes do #nur für dinge, die in der datenbank hinterlegt sind
        get '/', to: 'home#index' #leitet es an server und zurück zum browser
        post '/tasks/create', to: 'home#create'
        post '/tasks/delete', to: 'home#delete'
        get '/impressum', to: 'imprint#page'
        get '/users/new', to: 'users#new' # liefert das Registierungsformular aus
        post '/users/create', to: 'users#create'
        get '/users/signin', to: 'users#signin' # kein post, da nichts geschrieben wird, nur aufgerufen
        post '/sessions/create', to: 'sessions#create'
        post '/sessions/delete', to: 'sessions#delete' 
        # Reihenfolge wichtig, da von oben nach untern durchsucht wird
      end

      load_paths << [
        'controllers',
        'models',
        'views',
        'repositories'
      ]
      layout :application
    end

    load!
  end

  CONNECTION_URI = "sqlite://#{ __dir__ }/test.db"
  
  Lotus::Model.configure do
    adapter type: :sql, uri: CONNECTION_URI

    mapping do
      collection :tasks do
        entity     ToDoApp::Models::Task
        repository ToDoApp::Repositories::TaskRepository

        attribute :id,   Integer
        attribute :name, String
        attribute :user_id, Integer
      end
      collection :users do
        entity     ToDoApp::Models::User
        repository ToDoApp::Repositories::UserRepository

        attribute :id,   Integer
        attribute :email, String
        attribute :password, String
      end
    end
  end


  Lotus::Model.load!
end

def h(text)
  Rack::Utils.escape_html(text)
end


