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

    career_outlines = CareerVision.outlines.keys.map do |outline|
      {
        name: outline.humanize,
        value: outline
      }
    end

    career_visions = @current_employee.career_visions.map do |vision|
      {
        id: vision.id,
        name: vision.name,
        description: vision.description,
        outline: vision.outline.humanize
      }
    end


    render inertia: "MyCareer/Index", props: { motivations:, talents:, growth_areas:, career_outlines:, career_visions: }
  end
end
