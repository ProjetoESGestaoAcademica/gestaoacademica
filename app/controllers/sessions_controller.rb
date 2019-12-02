class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to :controller => 'welcome', :action => 'index'
    else
      flash[:danger] = 'Combinação de e-mail/senha incorreta'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to :controller => 'sessions', :action => 'new'
  end
end
