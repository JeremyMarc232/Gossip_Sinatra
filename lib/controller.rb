require 'sinatra'
require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/:id' do
    #erb :show, locals: {gossip_id: params['id']}
    "<html><head><title>Gossip</title></head><body><h1>Auteur:  #{Gossip.find(params["id"]).author} Content: #{Gossip.find(params["id"]).content}</body></html>"
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

end