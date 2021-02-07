class RelationshipsController < ApplicationController

 def following
    @user = User.find_by(params[:id])
    @users = @user.followed
    render 'show_follow'
 end

 def followers
    @user  = User.find_by(params[:id])
    @users = @user.follower
    render 'show_follower'
 end

 def create
  current_user.follow(params[:user_id])
  redirect_to request.referer
 end

 def destroy
  current_user.unfollow(params[:user_id])
  redirect_to request.referer
 end



end

