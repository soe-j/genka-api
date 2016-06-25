class TopController < ApplicationController
  def index
    render json: {resources: %w(projects, processes, members)}
  end
end
