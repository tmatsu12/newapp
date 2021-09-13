class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.all.order(updated_at: :desc)
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end
end
