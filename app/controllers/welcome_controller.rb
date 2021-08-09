class WelcomeController < ApplicationController
  
  def index
    @users = User.all
    @ransack_users = User.ransack(params[:users_search], search_key: :users_search)
    @users = @ransack_users.result
  end
end
