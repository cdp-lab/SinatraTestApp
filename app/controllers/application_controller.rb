# frozen_string_literal: true

module Controllers
  class ApplicationController < Sinatra::Base
    before do
      content_type 'application/json'
    end
  end
end
