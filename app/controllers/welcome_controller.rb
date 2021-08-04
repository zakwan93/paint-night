class WelcomeController < ApplicationController
  
  def index
    @users = User.all
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true)

    @ransack_users = User.ransack(params[:users_search], search_key: :users_search)
    @users = @ransack_users.result

  end
end
