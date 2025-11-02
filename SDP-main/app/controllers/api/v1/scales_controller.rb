class Api::V1::ScalesController < ApplicationController
  # :show, :update, :destroy metotları çalışmadan önce :set_scale metodunu çalıştır.
  # Bu, kodu tekrar etmemizi engeller (DRY prensibi).
  before_action :set_scale, only: [:show, :update, :destroy]

  # GET /api/v1/scales -> Tüm ölçekleri listeler
  def index
    @scales = Scale.all
    render json: @scales
  end

  # GET /api/v1/scales/1 -> Belirli bir ölçeği gösterir
  def show
    render json: @scale
  end

  # POST /api/v1/scales -> Yeni bir ölçek oluşturur
  def create
    @scale = Scale.new(scale_params)

    if @scale.save
      # Başarılı olursa, oluşturulan ölçeği ve 201 Created durum kodunu döndür.
      render json: @scale, status: :created
    else
      # Başarısız olursa, hataları ve 422 Unprocessable Entity durum kodunu döndür.
      render json: @scale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/scales/1 -> Belirli bir ölçeği günceller
  def update
    if @scale.update(scale_params)
      render json: @scale
    else
      render json: @scale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/scales/1 -> Belirli bir ölçeği siler
  def destroy
    @scale.destroy
    # Silme işlemi başarılı olduğunda içeriği olmayan (no content) 204 durum kodunu döndürmek yaygındır.
    head :no_content
  end

  private
    # Tekrar eden Scale.find(params[:id]) kodunu tek bir metoda toplar.
    def set_scale
      @scale = Scale.find(params[:id])
    end

    # Güvenlik için, dışarıdan sadece izin verdiğimiz parametrelerin alınmasını sağlar.
    def scale_params
      # Şimdilik user_id'yi hariç tutuyoruz. Onu daha sonra kimlik doğrulama eklediğimizde yapacağız.
      params.require(:scale).permit(:name, :description, :category)
    end
end