class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

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

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end

# pry(#<FiguresController>)> params
# => {"_method"=>"PATCH",
#  "figure"=>
#   {"name"=>"Bill DeBlasio", "title_ids"=>["1"], "landmark_ids"=>["10"]},
#  "title"=>{"name"=>""},
#  "landmark"=>{"name"=>""},
#  "splat"=>[],
#  "captures"=>["5"],
#  "id"=>"5"}
# [2] pry(#<FiguresController>)>

# pry(#<FiguresController>)> params
# => {"figure"=>{"name"=>"Ivanka", "landmark_ids"=>["1"]},
# "title"=>{"name"=>"First Lady"},
# "landmark"=>{"name"=>""}}
# [2] pry(#<FiguresController>)>
