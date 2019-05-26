class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    
    erb :'figures/index'
  end
  
  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure[name]"])
    binding.pry
    if !(params["figure[title_ids]"].empty?)
      params["figure[title_ids]"].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    if !(params["figure[landmark_ids]"].empty?)
      params["figure[landmark_ids]"].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end
    @figure.landmarks << Landmark.create(name: params["landmark[name]"])
    @figure.save
    
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params["figure[name]"]
    @figure.save
    
    redirect "/figures/#{params[:id]}"
  end
end
