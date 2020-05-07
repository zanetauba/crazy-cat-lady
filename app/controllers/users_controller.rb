class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @requests = @user.requests
  end

end
