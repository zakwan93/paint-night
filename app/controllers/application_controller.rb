class ApplicationController < ActionController::Base
    
     before_action :configure_permitted_parameters, if: :devise_controller?
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
                                                       :role_id, 
                                                       phones_attributes: 
                                                       [:id,:phone_type,:phone_number,:_destroy],addresses_attributes:
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
                                                           :role_id, 
                                                           phones_attributes: 
                                                           [:id,:phone_type,:phone_number,:_destroy],addresses_attributes:[:id,:address_line_1, :address_line_2, :city, :state, :zip, :county, :country, :address_type, :_destroy]
                                                         ])
  end

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end
end
