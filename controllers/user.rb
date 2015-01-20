module ToDoApp
  module Controllers
    module Users
      include ToDoApp::Controller

      action 'New' do
        def call(params)
        end
      end

      action 'Signin' do
        def call(params)
        end
      end

      action 'Create' do
        def call(params)
        # Hier wird ein neues Userobjekt angelegt
          new_user = ToDoApp::Models::User.new({
            email: params[:email], #benutzereingabe in formularfeld
            password: params[:password] #benutzereingabe in formularfeld
            })
        # Userobjekt in der Datenbank speichern
            ToDoApp::Repositories::UserRepository.create(new_user)  
            redirect_to '/' # nach dem Anlegen wieder auf die landingpage
        end
      end
    end
  end
end