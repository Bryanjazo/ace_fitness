require './config/environment'

class WorkoutController < ApplicationController
  get '/workouts' do
    redirect_if_not_logged_in
    @workouts = Workout.where('user_id IS NULL')
    @user_workouts = current_user.workouts
    erb :'workout/index'
  end


  get '/workouts/new' do
    redirect_if_not_logged_in
    erb :'workout/new'
  end

  post '/workouts/new' do
    redirect_if_not_logged_in
    # redirect_if_not_authorized
    workout = Workout.new(work_out: params[:name], description: params[:description])
    workout.user_id = current_user.id
    if workout.save
      redirect '/workouts'
    else
      "Error #{workout.errors.full_messages.join(', ')}"
      sleep(3)
      redirect '/workouts/new'
    end
  end

  get '/workouts/:id' do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    erb :'workout/show'
  end

  get '/workouts/:id/edit' do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    erb :'workout/edit'
  end

  patch '/workouts/:id' do
    redirect_if_not_logged_in
    workout = Workout.find_by_id(params[:id])
    workout.work_out = params[:name]
    workout.description = params[:description]
    if workout.save
      redirect '/workouts'
    else
      redirect "/workouts/#{workout.id}/edit"
    end
  end

  delete '/workouts/:id' do
    redirect_if_not_logged_in

    workout = Workout.find(params[:id])
    workout.destroy if current_user.workouts.include?(workout)
    redirect '/workouts'
  end




end
