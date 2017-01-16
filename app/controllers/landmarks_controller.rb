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

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    # @landmark.name = params["landmark"]["name"]
    # @landmark.year_completed = params["landmark"]["year_completed"]
    # @landmark.save
    @landmark.update(params[:landmark])
    #binding.pry
    redirect to "/landmarks/#{@landmark.id}"
  end

end

# [1] pry(#<LandmarksController>)> params
# => {"_method"=>"PATCH",
#  "landmark"=>{"name"=>"Madison Square Garden", "year_completed"=>"1901"},
#  "splat"=>[],
#  "captures"=>["1"],
#  "id"=>"1"}
