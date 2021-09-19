class PostsController < ApplicationController

  def index
    @user = current_user
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.all.order(updated_at: :desc)
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end

  def show
    @post = Post.find(params[:id])
    @prefecture = @post.prefecture
    @user = @post.user
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
    if user_signed_in?
      @prefecture = Prefecture.find(params[:prefecture_id])
      @post = Post.new
      @user = current_user
    else
      flash[:notice]="新規登録して下さい（簡単ログインが便利です！）"
      redirect_to new_user_registration_path
    end
  end

  def create
    @post = Post.new(post_params)
    @prefecture = @post.prefecture
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @user = current_user
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @prefecture = @post.prefecture
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    @prefecture = @post.prefecture
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "投稿を更新しました"
    else
      @user = @post.user
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(prefecture_id: @post.prefecture_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :city, :body, :prefecture_id, :image, :evaluation, :body1, :body2, :body3)
  end
end
