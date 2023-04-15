class Api::V1::ApplicationController < ActionController::API
    before_action :restrict_access
  respond_to :json

end
