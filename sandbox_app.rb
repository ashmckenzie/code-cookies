require 'json'
require 'sinatra/base'
require 'sinatra/cross_origin'
require 'ruby_cop'
require 'rspec'

require 'stringio'

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end

end

RSpec.configure do |c|
  c.add_formatter(:json)
  c.color = true
  c.formatter = :json
end

module Sinatra
  register CrossOrigin
end

class SandboxApp < Sinatra::Base

  configure do
    enable :cross_origin
  end

  post '/execute' do
    content_type :json
    headers['Access-Control-Allow-Origin'] = '*'

    if params[:implementation] && params[:test]

      code = params[:implementation].strip + "\n\n" + params[:test].strip
      output = execute_code(code)

      { output: output }.to_json

    else
      halt 400, 'No code to execute'
    end
  end

  private


    def execute_code code
      policy = RubyCop::Policy.new
      ast = RubyCop::NodeBuilder.build(code)

      if ast.accept(policy)
        capture_stdout do
          eval(code)
        end.string
      else
        'Unsafe'
      end
    end
end
