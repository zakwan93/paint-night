class RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(resource)
      thankyou_path
    end

  # def new
  #   super
  #   build_resource({})
  #    resource.build.phones
  #    resource.build.addresses
  #    respond_with self.resource
  # end
  
  # def create
  #   phone_index = params[:user][:primary_phone]
  #   params[:user][:phones_attributes][phone_index][:primary] = true
  #   super
  # end

  #  def update
  #   super
  #   phone_index = params[:user][:primary_phone]
  #   params[:user][:phones_attributes][phone_index][:primary] = true
  # end
end