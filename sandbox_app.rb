require 'json'
require 'sinatra/base'
require 'sinatra/cross_origin'
require 'sandrbox'

class SandboxApp < Sinatra::Base

  configure do
    enable :cross_origin
  end

  set :allow_origin, :any

  post '/execute' do
    content_type :json

    if params[:implementation] && params[:test]

      # code = params[:implementation] + params[:test]
      code = 'puts "test"'
      box = Sandrbox.perform(code)

      { output: box.output }.to_json
    else
      halt 400, 'No code to execute'
    end
  end
end
