class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :destroy]

  # GET /stages
  def index
    @stages = Stage.all
    render json: @stages
  end

  # GET /stages/1
  def show
    render json: @stage
  end

  # POST /stages
  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      render json: @stage, status: :created
    else
      render json: @stage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stages/1
  def destroy
    @stage.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:stage).permit(:name)
    end
end
