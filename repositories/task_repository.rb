module ToDoApp
	module Repositories
		class TaskRepository
			include Lotus::Repository

			# Sortiermethode 1. das letzte zum Schluss / 2. Alphabetisch
			def self.latest_tasks
				query do
					desc(:id)
				end
			end

			def self.alphabetically
				query do
					asc(:name)
				end
			end
		end	
	end
end

