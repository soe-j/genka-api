class ReportsController < ApplicationController
  def show
    @periods = Period.where(member_id: params[:member_id], )

  end

private
  def

  end
end
