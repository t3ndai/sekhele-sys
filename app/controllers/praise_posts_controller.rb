class PraisePostsController < ApplicationController
  before_action :set_praise_post, only: %i[ show edit update destroy ]
  before_action :set_channel, only: %i[ new create ]

  # GET /praise_posts or /praise_posts.json
  def index
    @praise_posts = PraisePost.all
  end

  # GET /praise_posts/1 or /praise_posts/1.json
  def show
  end

  # GET /praise_posts/new
  def new
    @praise_post = PraisePost.new
  end

  # GET /praise_posts/1/edit
  def edit
  end

  # POST /praise_posts or /praise_posts.json
  def create
    @praise_post = PraisePost.new(praise_post_params)
    @praise_post.nominator = @current_employee
    @praise_post.channel = @channel

    respond_to do |format|
      if @praise_post.save
        format.html { redirect_to @praise_post, notice: "Praise post was successfully created." }
        format.json { render :show, status: :created, location: @praise_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @praise_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /praise_posts/1 or /praise_posts/1.json
  def update
    respond_to do |format|
      if @praise_post.update(praise_post_params)
        format.html { redirect_to @praise_post, notice: "Praise post was successfully updated." }
        format.json { render :show, status: :ok, location: @praise_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @praise_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /praise_posts/1 or /praise_posts/1.json
  def destroy
    @praise_post.destroy!

    respond_to do |format|
      format.html { redirect_to praise_posts_path, status: :see_other, notice: "Praise post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_praise_post
      @praise_post = PraisePost.find(params.expect(:id))
    end

    def set_channel
      @channel = Channel.find(params.expect(:channel_id))
    end

    # Only allow a list of trusted parameters through.
    def praise_post_params
      params.expect(praise_post: [ :nominee_id, :nominator_id, :praise_type_id, :message, :channel_id ])
    end
end
