class UsersController < ApplicationController
  def index
    @user = User.all
  end

  # def create
  #     @user = User.new(user_params)
  #     respond_to do |format|
  #         format.html do

  #         end
  #     end
  # end

  def general_shopping_list
  end
end
