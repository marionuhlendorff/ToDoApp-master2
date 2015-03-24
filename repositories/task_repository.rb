module ToDoApp
	module Repositories
		class TaskRepository
			include Lotus::Repository

			#Aufgabe fuer einen bestimmten benuter laden
			def self.for_user(user_id)
				query do 
				#SELECT* FROM users WHERE user_id = x
				where(user_id: user_id)
			end
		end	

			# Sortiermethode 1. das letzte zum Schluss / 2. Alphabetisch
			def self.latest_tasks(user_id)
				query do
					where(user_id: user_id).desc(id)
				end
			end

			def self.alphabetically(user_id)
				query do
					where(user_id: user_id).desc
					asc(:name)
				end
			end
		end	
	end
end

