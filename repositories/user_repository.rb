module ToDoApp
	module Repositories
		class UserRepository
			include Lotus::Repository

			def self.find_by_email_and_password(email, password)
				query do
					where(email: email, password: password)
				end.first
			end
		end	
	end
end