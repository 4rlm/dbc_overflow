class VotesController < ApplicationController

  # before "/votes/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new votes."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: votes view all.
  get '/votes' do
    @votes = Vote.order('updated_at ASC').limit(10)
    # @votes = Vote.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'votes/index'
  end

  # NEW: votes new
  get '/votes/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Vote."
      erb :'users/login'
    else
      @vote = Vote.new  ## Prevents errors on Form Partial.
      erb :'votes/new'
    end

  end


  # CREATE:
  post '/votes' do
    @vote = Vote.create(params[:vote])
    redirect '/votes'
  end

  # SHOW: displays a single vote detail page.
  get '/votes/:id' do
    @vote = Vote.find(params[:id])
    erb :'votes/show'
  end

  # EDIT:
  get '/votes/:id/edit' do
    @vote = Vote.find(params[:id])
    erb :'votes/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_vote
    @vote = Vote.find(params[:id])
    @vote.update(params[:vote])
    redirect "/votes/#{@vote.id}"
  end

  # UPDATE: patch
  patch '/votes/:id' do
    update_vote
  end

  # UPDATE: put
  put '/votes/:id' do
    update_vote
  end

  #################################

  # DELETE:
  delete '/votes/:id' do
    Vote.find(params[:id]).destroy!
    redirect '/votes'
  end

end

