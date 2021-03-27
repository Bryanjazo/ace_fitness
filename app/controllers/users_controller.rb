require './config/environment'

class UserController < ApplicationController


  get '/signup' do
    erb :'/session/signup'
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      redirect '/login'
    else
      redirect '/signup'
    end
  end





end
