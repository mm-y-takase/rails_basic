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

  private
  def hoge(a)
  	return 0
  end
end
