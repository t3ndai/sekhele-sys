class AgendaItemsController < ApplicationController
  before_action :set_employee, only: %i[index create update]

  def index
  end

  def create
    @agenda_item = AgendaItem.new(agenda_items_params)
    @agenda_item.employee = @employee
    if @agenda_item.save
      head :ok
    end
  end

  def update
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def agenda_items_params
    params.expect(agenda_item: [ :name, :completed ])
  end
end
