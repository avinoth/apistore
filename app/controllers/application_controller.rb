class ApplicationController < ActionController::API

  def is_admin?
    params[:token] == "342af7884fbc47f298582ea936e0c761"
  end
end
