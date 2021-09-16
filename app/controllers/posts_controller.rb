class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.all.order(updated_at: :desc)
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end

  def show
    @post = Post.find(params[:id])
    @address = @post.prefecture.name+@post.city
    begin
      results = Geocoder.search(@address)
      @latlng = results.first.coordinates
    rescue
      @latlng = [40.7828, -73.9653]
      flash[:notice] = "市町村名を間違っていませんか？"
    end
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
    params.require(:post).permit(:title, :city, :body, :prefecture_id, :image, :evaluation, :body1, :body2, :body3)
  end
end
