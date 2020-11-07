class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @post = Post.new
    #@posts = Post.where('title like ?', "%#{params[:q]}%") if params[:q]
  end

  def show  
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      format.js { @post }
    end
  end
  
  def edit
  end

  def update
    @post.update(post_params)
    respond_to do |format|
      format.js { @post }
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js { @post }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title)
    end
end
