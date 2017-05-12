class TopController < ApplicationController
  def index
    @string = 'string vars'
    @arry = [0,1,2,3,4]
    @obj = {a:0,b:1}
    @number = 0
    @boolean = false
    @articles = Article.open.readable_for(current_member).order(released_at: :desc).limit(5)

  end
  def about
  end

  def not_found
    raise ActionController::RoutingError, "No route matches #{request.path.inspect}"
  end

  def bad_request
    raise ActionController::ParameterMissing, ""
  end

  def internal_server_error
    raise Exception
  end

  private
  def hoge(a)
  	return 0
  end
end
