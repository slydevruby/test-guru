# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # POST /resource/sign_in
    def create
      super
      set_flash_message! :notice, :welcome, username: resource.first_name
    end
  end
end
