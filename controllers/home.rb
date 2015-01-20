module ToDoApp
  module Controllers
    module Home
      include ToDoApp::Controller

      action 'Index' do
        expose :tasks

        def call(params)
          puts "MY PARAMS: #{params.inspect}"
          if params[:newest]
            @tasks = ToDoApp::Repositories::TaskRepository.latest_tasks
         elsif params [:alphabetically]    
            @tasks = ToDoApp::Repositories::TaskRepository.alphabetically        
         else
            @tasks = ToDoApp::Repositories::TaskRepository.all
          end
        end
      end

      action 'Create' do
        def call(params)
          new_task = ToDoApp::Models::Task.new({name: params[:task]})
          unless new_task.name.nil? || new_task.name.strip.empty? 
            ToDoApp::Repositories::TaskRepository.create(new_task)  
            redirect_to '/'
          end
        end
      end

      action 'Delete' do
        def call(params)
          task = ToDoApp::Repositories::TaskRepository.find(params[:task_id])
          ToDoApp::Repositories::TaskRepository.delete(task)
          redirect_to '/'


        end
      end
    end
  end
end