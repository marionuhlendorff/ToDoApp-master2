module ToDoApp
	module Controllers
		module Sessions
			include ToDoApp::Controller
			action 'Create' do
				def call(params)
					puts "hallo"
				end
			end
		end
	end
end

