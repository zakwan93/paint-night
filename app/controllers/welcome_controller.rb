class WelcomeController < ApplicationController
  
  def index
    @users = User.all
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true)

    @ransack_users = User.ransack(params[:users_search], search_key: :users_search)
    @users = @ransack_users.result

  end

   def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
    @last_login = 'never'
    end
  end
end
