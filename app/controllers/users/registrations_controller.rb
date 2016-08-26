class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    if session[:retake_create_event]
      session.delete(:retake_create_event)
      return new_event_path
    end
    super
  end
end
