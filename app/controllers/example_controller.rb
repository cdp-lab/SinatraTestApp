module Controllers
  class ExampleController < ApplicationController
    get '/' do
      CODEPOP
      "it's alive!".to_json
    end
  end
end
