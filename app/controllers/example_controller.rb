module Controllers
  class ExampleController < ApplicationController
    get '/' do
      POPAC
      "it's alive!".to_json
    end
  end
end
