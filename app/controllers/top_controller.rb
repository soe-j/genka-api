class TopController < ApplicationController
  def index
    render json: {resources: %w(projects processes members periods)}
  end

  def new
    @project = Project.new
    @stage   = Stage.new
    @member  = Member.new
    @period  = Period.new
    render :new
  end
end
