class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_global_varriables, if: :user_signed_in?
  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :middle_name, 
                                                       :last_name, 
                                                       :dob, 
                                                       :gender, 
                                                       :title, 
                                                       :age, 
                                                       :ethinicity, 
                                                       :language, 
                                                       :primary_phone_type,
                                                       :primary_phone,
                                                       :primary_address_line_1, 
                                                       :primary_address_line_2, 
                                                       :primary_city, 
                                                       :primary_state, 
                                                       :primary_zip, 
                                                       :primary_county, 
                                                       :primary_country, 
                                                       :primary_address_type,
                                                       :role_id, 
                                                       phones_attributes: 
                                                       [:id,:phone_type,:primary_phone,:_destroy],addresses_attributes:
                                                       [:id,:address_line_1, :address_line_2, :city, :state, :zip, :county, :country, :address_type, :_destroy]
                                                         ])
    devise_parameter_sanitizer.permit(:account_update, keys: 
                                                          [:first_name, 
                                                           :middle_name, 
                                                           :last_name, 
                                                           :dob, 
                                                           :gender, 
                                                           :title, 
                                                           :age, 
                                                           :ethinicity, 
                                                           :language, 
                                                           :primary_phone_type,
                                                           :primary_phone,
                                                           :primary_address_line_1, 
                                                           :primary_address_line_2, 
                                                           :primary_city, 
                                                           :primary_state, 
                                                           :primary_zip, 
                                                           :primary_county, 
                                                           :primary_country, 
                                                           :primary_address_type,
                                                           :role_id, 
                                                           phones_attributes: 
                                                           [:id,:phone_type,:primary_phone,:_destroy],addresses_attributes:[:id,:address_line_1, :address_line_2, :city, :state, :zip, :county, :country, :address_type, :_destroy]
                                                         ])
  end

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Only Admin have Access To This Page'
    redirect_to root_url
  end

  def set_global_varriables
    @ransack_users = User.ransack(params[:users_search], search_key: :users_search)
  end
end
