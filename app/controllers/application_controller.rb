require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    use Rack::Flash, sweep: true
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'djuew7w7#iwi**ss0230!@33mmf'
  end

  get '/' do
    redirect '/login'
  end

  helpers do
    def current_user
      @current_user ||= User.find_by_id(session['user_id'])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect '/login' unless logged_in?
    end

    def redirect_if_logged_in
      redirect '/homepage' if logged_in?
    end
  end
end
