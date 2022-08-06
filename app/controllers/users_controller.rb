class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def general_shopping_list; end
end
