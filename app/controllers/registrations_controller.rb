class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    resource = build_resource
    if resource.save
      #resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      scope = Devise::Mapping.find_scope!(resource)
      #resource ||= resource_or_scope
      sign_in(scope, resource) unless warden.user(scope) == resource
      #User.authenticate()

      # todo: Авторизовать пользователя сразу после регистрации
      render :status => 200, :json => { :success => true, :user => resource }
    else
      render :json => resource.errors, :status => :unprocessable_entity
    end
  end

  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end

end