# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren
class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    set_flash_message! :notice, :welcome, username: resource.first_name
  end
end
# rubocop:enable Style/ClassAndModuleChildren
