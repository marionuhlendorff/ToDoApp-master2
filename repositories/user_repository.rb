module ToDoApp
	module Repositories
		class UserRepository
			include Lotus::Repository

			def self.by_id(user_id)
				query do
					where(id: user_id)
				end.first #entweder ein ergebnis aus der db oder keins, sofern ja, gib mir das erste ergebnis
			end

			def self.find_by_email_and_password(email, password)
				query do
					where(email: email, password: password)
				end.first
			end
		end	
	end
end