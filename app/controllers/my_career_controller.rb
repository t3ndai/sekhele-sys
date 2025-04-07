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

    growth_areas = @current_employee.growth_areas.map do |growth_area|
      {
        id: growth_area.id,
        name: growth_area.name,
        description: growth_area.description
      }
    end


    render inertia: "MyCareer/Index", props: { motivations:, talents:, growth_areas: }
  end
end
