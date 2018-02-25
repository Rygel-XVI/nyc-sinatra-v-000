class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:slug' do
    @figure = Figure.create(params[:figure])

    if empty_or_nil?(params[:title][:name])
      @figure.titles << Title.create(params[:title])
    else
      @figure.titles = params[:figure][:title_ids].map {|id| Title.all.find(id)} if !params[:figure][:title_ids].empty?
    end

    if empty_or_nil?(params[:landmark][:name])
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      @figure.landmarks = params[:figure][:landmark_ids].map {|id| Landmark.all.find(id)} if !params[:figure][:landmark_ids].empty?
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    if empty_or_nil?(params[:figure][:name])
      @figure.update(params[:figure])
    end

    if empty_or_nil?(params[:title][:name])
      @figure.titles << Title.create(params[:title])
    else
      @figure.titles = params[:figure][:title_ids].map {|id| Title.all.find(id)} if !params[:figure][:title_ids].empty?
    end

    if empty_or_nil?(params[:landmark][:name])
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      @figure.landmarks = params[:figure][:landmark_ids].map {|id| Landmark.all.find(id)} if !params[:figure][:landmark_ids].empty?
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  def empty_or_nil?(param)
    !param.nil? || !param.empty?
  end

end
