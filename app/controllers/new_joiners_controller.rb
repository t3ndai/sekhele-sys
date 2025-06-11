class NewJoinersController < ApplicationController
  before_action :set_new_joiner, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /new_joiners
  def index
    @new_joiners = NewJoiner.all
    render inertia: 'NewJoiner/Index', props: {
      new_joiners: @new_joiners.map do |new_joiner|
        serialize_new_joiner(new_joiner)
      end
    }
  end

  # GET /new_joiners/1
  def show
    render inertia: 'NewJoiner/Show', props: {
      new_joiner: serialize_new_joiner(@new_joiner)
    }
  end

  # GET /new_joiners/new
  def new
    @new_joiner = NewJoiner.new
    render inertia: 'NewJoiner/New', props: {
      new_joiner: serialize_new_joiner(@new_joiner)
    }
  end

  # GET /new_joiners/1/edit
  def edit
    render inertia: 'NewJoiner/Edit', props: {
      new_joiner: serialize_new_joiner(@new_joiner)
    }
  end

  # POST /new_joiners
  def create
    @new_joiner = NewJoiner.new(new_joiner_params)

    if @new_joiner.save
      redirect_to @new_joiner, notice: "New joiner was successfully created."
    else
      redirect_to new_new_joiner_url, inertia: { errors: @new_joiner.errors }
    end
  end

  # PATCH/PUT /new_joiners/1
  def update
    if @new_joiner.update(new_joiner_params)
      redirect_to @new_joiner, notice: "New joiner was successfully updated."
    else
      redirect_to edit_new_joiner_url(@new_joiner), inertia: { errors: @new_joiner.errors }
    end
  end

  # DELETE /new_joiners/1
  def destroy
    @new_joiner.destroy!
    redirect_to new_joiners_url, notice: "New joiner was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_joiner
      @new_joiner = NewJoiner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_joiner_params
      params.require(:new_joiner).permit(:start_date, :manager_id, :job_applicant_id)
    end

    def serialize_new_joiner(new_joiner)
      new_joiner.as_json(only: [
        :id, :start_date, :manager_id, :job_applicant_id
      ])
    end
end
