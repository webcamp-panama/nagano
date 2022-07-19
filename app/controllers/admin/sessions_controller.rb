# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def after_sign_in_path_for(resource)
      admin_items_path
    end

    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end

end
