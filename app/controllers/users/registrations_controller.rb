# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super do
      self.resource.delete_avatar if delete_avatar?
    end
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(resource)
    end

  private
    def delete_avatar?
      !params[:user][:delete_avatar_check].to_i.zero?
    end
end
