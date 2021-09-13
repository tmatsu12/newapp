class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.all.order(updated_at: :desc)
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end

  def new
    @prefecture = Prefecture.find(params[:prefecture_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.prefecture_id = 36
    @post.user_id = 1
    @post.save
    redirect_to posts_path(prefecture_id: 36)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
