class Api::V1::PackagesController < ApplicationController
  before_action :set_package, only: [:show, :update, :destroy]

  # GET /api/v1/packages
  def index
    @packages = Package.all
    render json: @packages
  end

  # GET /api/v1/packages/1
  def show
    render json: @package
  end

  # POST /api/v1/packages
  def create
    @package = Package.new(package_params)

    if @package.save
      render json: @package, status: :created
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/packages/1
  def update
    if @package.update(package_params)
      render json: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/packages/1
  def destroy
    @package.destroy
    head :no_content
  end

  private
    def set_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:name, :credits, :price)
    end
end