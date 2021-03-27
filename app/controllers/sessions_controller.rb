class SessionController < ApplicationController

  get '/homepage' do
    erb :'workout/homepage'
  end

  get '/login' do
    redirect_if_logged_in
    erb :welcome
  end

  post '/login' do
    redirect_if_logged_in
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/homepage'
  else
    flash[:error] = "Incorrect Username or Password"
    redirect '/login'
    end
  end

  get '/logout' do
  redirect_if_not_logged_in
  session.delete("user_id")
    redirect '/login'
  end
end
