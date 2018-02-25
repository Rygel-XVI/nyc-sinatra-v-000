class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    if empty_or_nil?(params[:landmark][:name])
      @landmark.update(name: params[:landmark][:name])
    end

    if empty_or_nil?(params[:landmark][:year_completed])
      @landmark.update(year_completed: params[:landmark][:year_completed])
    end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  def empty_or_nil?(param)
    !param.nil? || !param.empty?
  end

end
