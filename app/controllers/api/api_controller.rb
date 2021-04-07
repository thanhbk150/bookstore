class Api::ApiController < ApplicationController
  before_action :check_authentication

  private

  def check_authentication
    if current_user.blank?
      render json: { status: :unauthorized, errors: "Access denied" }
    end
  end
end