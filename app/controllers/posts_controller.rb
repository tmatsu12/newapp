class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.all.order(updated_at: :desc)
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end

  def show
    @post = Post.find(params[:id])
    @address = @post.prefecture.name+@post.title
    p @address
    results = Geocoder.search(@address)
    p results
    @latlng = results.first.coordinates
    p @latlng
  end

  def new
    @prefecture = Prefecture.find(params[:prefecture_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1
    @post.save
    redirect_to posts_path(prefecture_id: @post.prefecture_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :prefecture_id, :image, :evaluation, :body1, :body2, :body3)
  end
end
