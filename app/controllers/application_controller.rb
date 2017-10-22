require 'will_paginate/active_record'

class ApplicationController < Sinatra::Base
  include ApplicationHelper
  include WillPaginate::Sinatra::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  before do
    @alert_msg = {}
    logged_in
  end

  get '/' do
    # @alert_msg[:success_alert] = "Success test alert ..."
    # @alert_msg[:danger_alert] = "Danger test alert ..."

    # !logged_in ? (redirect 'users/login') : redirect_to_home_page

    @questions = Question.all.order("updated_at DESC")

    erb :'index'
  end

  def redirect_to_questions
    redirect to '/questions'
  end

  def redirect_to_answers
    redirect to '/answers'
  end

  def redirect_to_comments
    redirect to '/comments'
  end

  def redirect_to_votes
    redirect to '/votes'
  end



end
