module ToDoApp
	module Controllers
		module Sessions
			include ToDoApp::Controller
			action 'Create' do
				include Lotus::Action::Session
				def call(params)
					user = ToDoApp::Repositories::UserRepository.find_by_email_and_password(params[:email], params[:password]) #kein .first dahinter, da schon im user_repository
					if user.nil?
						#user not found
						redirect_to '/users/signin'	
					else
						session[:user] = user.id
						redirect_to '/'	
					end
				end
			end	

			action 'Delete' do
				include Lotus::Action::Session
				def call(params)
					session[:user] = nil
					redirect_to '/'	
				end
			end
		end
	end
end

