class PhotoController < ApplicationController
  def index
    @user = User.find(params[:id])
    @photo = Photo.where(user_id: params[:id])
  end

  def find_first_name(user_id)
    @user = User.find(user_id)
    return @user.first_name
  end

  helper_method :find_first_name
end
