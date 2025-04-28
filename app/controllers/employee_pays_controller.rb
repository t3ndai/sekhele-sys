class EmployeePaysController < ApplicationController
  before_action :set_employee_pay, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /employee_pays
  def index
    @employee_pays = EmployeePay.all
    render inertia: 'EmployeePay/Index', props: {
      employee_pays: @employee_pays.map do |employee_pay|
        serialize_employee_pay(employee_pay)
      end
    }
  end

  # GET /employee_pays/1
  def show
    render inertia: 'EmployeePay/Show', props: {
      employee_pay: serialize_employee_pay(@employee_pay)
    }
  end

  # GET /employee_pays/new
  def new
    @employee_pay = EmployeePay.new
    render inertia: 'EmployeePay/New', props: {
      employee_pay: serialize_employee_pay(@employee_pay)
    }
  end

  # GET /employee_pays/1/edit
  def edit
    render inertia: 'EmployeePay/Edit', props: {
      employee_pay: serialize_employee_pay(@employee_pay)
    }
  end

  # POST /employee_pays
  def create
    @employee_pay = EmployeePay.new(employee_pay_params)

    if @employee_pay.save
      redirect_to @employee_pay, notice: "Employee pay was successfully created."
    else
      redirect_to new_employee_pay_url, inertia: { errors: @employee_pay.errors }
    end
  end

  # PATCH/PUT /employee_pays/1
  def update
    if @employee_pay.update(employee_pay_params)
      redirect_to @employee_pay, notice: "Employee pay was successfully updated."
    else
      redirect_to edit_employee_pay_url(@employee_pay), inertia: { errors: @employee_pay.errors }
    end
  end

  # DELETE /employee_pays/1
  def destroy
    @employee_pay.destroy!
    redirect_to employee_pays_url, notice: "Employee pay was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_pay
      @employee_pay = EmployeePay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_pay_params
      params.require(:employee_pay).permit(:employee_id, :start_date, :end_date, :amount, :pay_type, :currency, :frequency)
    end

    def serialize_employee_pay(employee_pay)
      employee_pay.as_json(only: [
        :id, :employee_id, :start_date, :end_date, :amount, :pay_type, :currency, :frequency
      ])
    end
end
