class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def new
    super # no customization, simply call the devise implementation
  end

  def create

      build_resource
      if resource.save
         render :status => 200, :json => resource
      else
        render :json => resource.errors, :status => :unprocessable_entity
      end

  end

  def update
    super # no customization, simply call the devise implementation 
  end

  protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end