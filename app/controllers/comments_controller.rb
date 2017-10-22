class CommentsController < ApplicationController

  # before "/comments/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new comments."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: comments view all.
  get '/comments' do
    @comments = Comment.order('updated_at ASC').limit(10)
    # @comments = Comment.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'comments/index'
  end

  # NEW: comments new
  get '/comments/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Comment."
      erb :'users/login'
    else
      @comment = Comment.new  ## Prevents errors on Form Partial.
      erb :'comments/new'
    end

  end


  # CREATE:
  post '/comments' do
    body = params[:comment][:body]
    commentable_type = params[:comment][:commentable_type]
    commentable_id = params[:comment][:commentable_id]

    comment = Comment.find_or_initialize_by(body: body)
    question_or_answer = commentable_type.classify.constantize.find(commentable_id)
    question_or_answer.comments << comment
    @user.comments << comment
    comment.save

    redirect '/questions'
  end

  # SHOW: displays a single comment detail page.
  get '/comments/:id' do
    @comment = Comment.find(params[:id])
    erb :'comments/show'
  end

  # EDIT:
  get '/comments/:id/edit' do
    @comment = Comment.find(params[:id])
    erb :'comments/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_comment
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment])
    redirect "/comments/#{@comment.id}"
  end

  # UPDATE: patch
  patch '/comments/:id' do
    update_comment
  end

  # UPDATE: put
  put '/comments/:id' do
    update_comment
  end

  #################################

  # DELETE:
  delete '/comments/:id' do
    Comment.find(params[:id]).destroy!
    redirect '/comments'
  end

end
