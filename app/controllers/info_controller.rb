class InfoController < ApplicationController
  respond_to :json

  def info
    api_info = { version: '0.0.0.1', name: 'October API' }
    respond_with api_info
  end

end

