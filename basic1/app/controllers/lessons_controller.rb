class LessonsController < ApplicationController

	before_action :set_message, only: :step7

	def step1
		render text: "hello, #{params[:name]}"
	end

	def step2
		render text: params[:controller]+ "#" + params[:action]
	end

	def step3
		redirect_to action: "step4"
	end

	def step4
		render text: "step4"
	end

	def step5
		flash[:notice] = "to step6"
		redirect_to action: "step6"
	end

	def step6
		render text: flash[:notice]
	end

	def step7
		render text: @set_message
	end

	def step8
		@price = (100 * 1.05).floor
	end

	def step9
		@price = nil
		render "step8"
	end

	def step10
		@population = 7044144
		@surface = 141.31
	end

	def step11
		@body = "hoge¥nhogehoge¥nhohohohohohohoho"
	end

	private
	def set_message
		@set_message = "private method"
	end
end
