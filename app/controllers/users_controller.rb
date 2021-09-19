class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "ユーザー情報を更新しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :prefecture1_id, :prefecture2_id)
  end
end
