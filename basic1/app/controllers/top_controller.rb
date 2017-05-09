class TopController < ApplicationController
  def index
  	@string = 'string vars'
  	@arry = [0,1,2,3,4]
  	@obj = {a:0,b:1}
  	@number = 0
  	@boolean = false
  end
end
