class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end
end


# pry(#<FiguresController>)> params
# => {"figure"=>{"name"=>"Ivanka", "landmark_ids"=>["1"]},
# "title"=>{"name"=>"First Lady"},
# "landmark"=>{"name"=>""}}
# [2] pry(#<FiguresController>)>
