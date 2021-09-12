class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts
    @residents = @prefecture.residents
    @wannalivings = @prefecture.wannalivings
  end
end
