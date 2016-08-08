class ReportsController < ApplicationController
  def show
    @periods = Period.all
  end
end
