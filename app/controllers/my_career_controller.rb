class MyCareerController < ApplicationController
  def index
    motivations = @current_employee.motivations.map do |motivation|
      {
        id: motivation.id,
        name: motivation.name,
        description: motivation.description
      }
    end

    talents = @current_employee.talents.map do |talent|
      {
        id: talent.id,
        name: talent.name,
        description: talent.description
      }
    end


    render inertia: "MyCareer/Index", props: { motivations:, talents: }
  end
end
