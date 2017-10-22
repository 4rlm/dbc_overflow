class QuestionsController < ApplicationController

  before "/questions/*" do
    if !request.post?
      if !logged_in
        @alert_msg[:danger_alert] = "Please login to choose new questions."
        erb :'users/login'
      end
    end
  end

  # INDEX: questions view all.
  get '/questions' do
    @questions = Question.order('updated_at DESC')
    # @questions = Question.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'questions/index'
  end

  # NEW: questions new
  get '/questions/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Question."
      erb :'users/login'
    else
      @question = Question.new  ## Prevents errors on Form Partial.
      erb :'questions/new'
    end

  end


  # CREATE:
  post '/questions' do
    params[:question][:user_id] = @user.id
    question = Question.find_or_create_by(params[:question])

    redirect '/questions'
  end

  # SHOW: displays a single question detail page.
  get '/questions/:id' do
    @question = Question.find(params[:id])
    count_question_view_clicks(@question)
    erb :'questions/show'
  end

  # EDIT:
  get '/questions/:id/edit' do
    @question = Question.find(params[:id])
    erb :'questions/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_question
    @question = Question.find(params[:id])
    @question.update(params[:question])
    redirect "/questions/#{@question.id}"
  end

  # UPDATE: patch
  patch '/questions/:id' do
    update_question
  end

  # UPDATE: put
  put '/questions/:id' do
    update_question
  end

  #################################

  # DELETE:
  delete '/questions/:id' do
    Question.find(params[:id]).destroy!
    redirect '/questions'
  end

end
