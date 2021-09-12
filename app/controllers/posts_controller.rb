class PostsController < ApplicationController

  def index
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts
    @nowlivings = @prefecture.nowlivings
    @pastlivings = @prefecture.pastlivings
    @wannalivings = @prefecture.wannalivings
  end
end
