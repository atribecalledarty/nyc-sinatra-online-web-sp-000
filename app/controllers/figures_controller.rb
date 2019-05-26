class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    
    erb :'figures/index'
  end
  
  get '/figures/new' do
    
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
