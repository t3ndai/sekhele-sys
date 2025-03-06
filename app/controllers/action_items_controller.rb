class ActionItemsController < ApplicationController
  before_action :set_action_item, only: %i[ show edit update destroy ]
  before_action :set_one_to_one, only: %i[ index new create ]

  # GET /action_items or /action_items.json
  def index
    @action_items = ActionItem.all
  end

  # GET /action_items/1 or /action_items/1.json
  def show
  end

  # GET /action_items/new
  def new
    @action_item = ActionItem.new
  end

  # GET /action_items/1/edit
  def edit
  end

  # POST /action_items or /action_items.json
  def create
    @action_item = ActionItem.new(action_item_params)
    @action_item.one_to_one = @one_to_one

    respond_to do |format|
      if @action_item.save
        format.html { redirect_to @action_item, notice: "Action item was successfully created." }
        format.json { render :show, status: :created, location: @action_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_items/1 or /action_items/1.json
  def update
    respond_to do |format|
      if @action_item.update(action_item_params)
        format.html { redirect_to @action_item, notice: "Action item was successfully updated." }
        format.json { render :show, status: :ok, location: @action_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_items/1 or /action_items/1.json
  def destroy
    @action_item.destroy!

    respond_to do |format|
      format.html { redirect_to action_items_path, status: :see_other, notice: "Action item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_item
      @action_item = ActionItem.find(params.expect(:id))
    end

    def set_one_to_one
      @one_to_one = OneToOne.find(params.expect(:one_to_one_id))
    end

    # Only allow a list of trusted parameters through.
    def action_item_params
      params.expect(action_item: [ :name, :completed, :one_to_one_id ])
    end
end
