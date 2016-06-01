class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json

  def index
    render layout: layout_name
  end

  

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:account_update) << :name
  end


  private

    def layout_name
      if params[:layout] == 0
        false
      else
        'application'
      end
    end

end
