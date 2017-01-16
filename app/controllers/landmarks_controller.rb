class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "/landmark/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end


  # post '/figures' do
  #   @figure = Figure.create(params[:figure])
  #   if !params[:title].empty?
  #     @figure.titles << Title.create(params[:title])
  #   end
  #   if !params[:landmark].empty?
  #     @figure.landmarks << Landmark.create(params[:landmark])
  #   end
  #   @figure.save
  #   redirect to "/figures/#{@figure.id}"
  # end

end

{"landmark"=>{"name"=>"Arc de Triomphe", "year_completed"=>"1806"}}
