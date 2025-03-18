class ChannelPostsController < ApplicationController
  before_action :set_channel_post, only: %i[ show edit update destroy ]
  before_action :set_channel, only: %i[ index new create ]

  # GET /channel_posts or /channel_posts.json
  def index
    @channel_posts = ChannelPost.all
  end

  # GET /channel_posts/1 or /channel_posts/1.json
  def show
  end

  # GET /channel_posts/new
  def new
    @channel_post = ChannelPost.new
  end

  # GET /channel_posts/1/edit
  def edit
  end

  # POST /channel_posts or /channel_posts.json
  def create
    @channel_post = ChannelPost.new(channel_post_params)
    @channel_post.channel = @channel
    @channel_post.creator = @current_employee

    respond_to do |format|
      if @channel_post.save
        format.html { redirect_to @channel_post, notice: "Channel post was successfully created." }
        format.json { render :show, status: :created, location: @channel_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @channel_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_posts/1 or /channel_posts/1.json
  def update
    respond_to do |format|
      if @channel_post.update(channel_post_params)
        format.html { redirect_to @channel_post, notice: "Channel post was successfully updated." }
        format.json { render :show, status: :ok, location: @channel_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @channel_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_posts/1 or /channel_posts/1.json
  def destroy
    @channel_post.destroy!

    respond_to do |format|
      format.html { redirect_to channel_posts_path, status: :see_other, notice: "Channel post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_post
      @channel_post = ChannelPost.find(params.expect(:id))
    end

    def set_channel
      @channel = Channel.find(params.expect(:channel_id))
    end

    # Only allow a list of trusted parameters through.
    def channel_post_params
      params.expect(channel_post: [ :creator_id, :likes, :channel_id, :content ])
    end
end
