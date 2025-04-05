class OneToOnesController < ApplicationController
  before_action :set_one_to_one, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ index new create ]

  # GET /one_to_ones or /one_to_ones.json
  def index
    # my one_on_ones
    one_to_ones = @employee.one_to_ones.map do |one_to_one|
      {
        id: one_to_one.id,
        note: one_to_one.note,
        meeting_on: one_to_one.created_at.strftime("%d-%b")
      }
    end

    render inertia: "OneToOnes/Index", props: {
      one_to_ones: }
  end



  # GET /one_to_ones/1 or /one_to_ones/1.json
  def show
  end

  # GET /one_to_ones/new
  def new
    date = DateTime.now.strftime("%a-%b-%d")
    @one_to_one = OneToOne.new
    agenda_items = @employee.agenda_items.map do |agenda_item|
      {
        id: agenda_item.id,
        name: agenda_item.name
      }
    end

    render inertia: "OneToOnes/New", props: {
      one_to_one: @one_to_one,
      date:,
      report_id: @employee.id,
      agenda_items:
    }
  end

  # GET /one_to_ones/1/edit
  def edit
  end

  # POST /one_to_ones or /one_to_ones.json
  def create
    @one_to_one = OneToOne.new(one_to_one_params)
    @one_to_one.employee = @employee
    @one_to_one.manager = @current_employee

    respond_to do |format|
      if @one_to_one.save
        format.html { redirect_to @one_to_one, notice: "One to one was successfully created." }
        format.json { render :show, status: :created, location: @one_to_one }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @one_to_one.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /one_to_ones/1 or /one_to_ones/1.json
  def update
    respond_to do |format|
      if @one_to_one.update(one_to_one_params)
        format.html { redirect_to @one_to_one, notice: "One to one was successfully updated." }
        format.json { render :show, status: :ok, location: @one_to_one }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @one_to_one.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /one_to_ones/1 or /one_to_ones/1.json
  def destroy
    @one_to_one.destroy!

    respond_to do |format|
      format.html { redirect_to one_to_ones_path, status: :see_other, notice: "One to one was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_to_one
      @one_to_one = OneToOne.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params.expect(:employee_id))
    end

    # Only allow a list of trusted parameters through.
    def one_to_one_params
      params.expect(one_to_one: [ :employee_id, :manager_id, :note ])
    end
end
