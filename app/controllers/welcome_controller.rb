class WelcomeController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user
  def index

  end
end
