class AnswersController < ApplicationController

  # before "/answers/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new answers."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: answers view all.
  get '/answers' do
    @answers = Answer.order('updated_at DESC')
    # @answers = Answer.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'answers/index'
  end

  # NEW: answers new
  get '/answers/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Answer."
      erb :'users/login'
    else
      @answer = Answer.new  ## Prevents errors on Form Partial.
      erb :'answers/new'
    end

  end


  # CREATE:
  post '/answers' do
    params[:answer][:user_id] = @user.id if params[:answer][:user_id].nil?
    answer = Answer.find_or_create_by(params[:answer])

    redirect '/questions'
  end

  # SHOW: displays a single answer detail page.
  get '/answers/:id' do
    @answer = Answer.find(params[:id])
    @question = Question.new  ## Prevents errors on Form Partial.
    erb :'answers/show'
  end

  # EDIT:
  get '/answers/:id/edit' do
    @answer = Answer.find(params[:id])
    erb :'answers/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_answer
    @answer = Answer.find(params[:id])
    @answer.update(params[:answer])
    redirect "/answers/#{@answer.id}"
  end

  # UPDATE: patch
  patch '/answers/:id' do
    update_answer
  end

  # UPDATE: put
  put '/answers/:id' do
    update_answer
  end

  #################################

  # DELETE:
  delete '/answers/:id' do
    Answer.find(params[:id]).destroy!
    redirect '/answers'
  end

end
