class SessionsController < ApplicationController
  def create
    member = Member.authenticate(params[:name], params[:password])
    if member
      session[:member_id] = member.member_id
    else
      flash.alert = "名前かパスワードが未一致です"
    end

    redirect_to :root
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end

end
