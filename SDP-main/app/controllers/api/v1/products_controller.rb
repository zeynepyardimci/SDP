class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/v1/products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /api/v1/products/1
  def show
    render json: @product
  end

  # POST /api/v1/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private
    # 'before_action' için product'ı bulan yardımcı metod
    def set_product
      @product = Product.find(params[:id])
    end

    # Strong Parameters: Sadece izin verilen parametrelerin geçmesini sağlar.
    # Product modelinizde hangi alanlar varsa burayı ona göre düzenlemelisiniz.
    def product_params
      # ÖNEMLİ: Modelinizdeki alanlara göre (:name, :description, :price vb.) 
      # 'permit' kısmını güncelleyin.
      params.require(:product).permit(:name, :description, :price, :stock_quantity) 
    end
end