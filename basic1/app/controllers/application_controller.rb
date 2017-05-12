class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  class Forbidden < StandardError; end
  class NotFound < StandardError; end

  if Rails.env.production?
    rescure_form Exception, with: :rescure_500
    rescure_form ActionController::RoutingError, with: :rescure_404
    rescure_form ActiveRecord::RecordNotFound, with: :rescure_404
    rescure_form ActionController::ParameterMissing, with: :rescure_400
  end

  resucue_from Forbidden, with: :rescure_403
  resucue_from NotFount, with: :rescure_404

  private
  def rescure_400(exception)
    render "errors/bad_request", status: 400, layout: "error", formats: [:html]
  end

  def rescure_403(exception)
    render "errors/forbidden", status: 403, layout: "error", formats: [:html]
  end

  def rescure_404(exception)
    render "errors/NotFound", status: 404, layout: "error", formats: [:html]
  end

  def rescure_500(exception)
    render "errors/internal_server_error", status: 500, layout: "error", formats: [:html]
  end


  def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def login_required
    raise Forbidden unless current_member
  end
end
