class ProjectsController < ApplicationController

  def show
    project = Project.find(params[:id])
    @project_info = {
                    :name => project.name, 
                    :material=> project.material, 
                    :theme => project.challenge.theme,
                    :count => project.count_contestants,
                    :average_age => project.average_age
                    }
  end

end
