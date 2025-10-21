class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show] # Not: Update ve Destroy eklersek buraya ekleyeceğiz.

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users.as_json(except: :password_digest) # Şifre hash'ini DAHİL ETME!
  end

  # GET /api/v1/users/1
  def show
    render json: @user.as_json(except: :password_digest) # Şifre hash'ini DAHİL ETME!
  end

  # POST /api/v1/users -> YENİ EKLENDİ
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(except: :password_digest), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # YENİ EKLENDİ: Güvenlik için sadece izin verilen parametreleri alır.
    def user_params
      params.require(:user).permit(:name, :email, :password) # Şifreyi de alıyoruz.
    end

    # Not: Update ve Destroy metotları burada yok.
end