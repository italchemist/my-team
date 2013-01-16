class Api::ApiController < ApplicationController
  def id
    params[:id]
  end
end