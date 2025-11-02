class Api::V1::WelcomeController < ApplicationController
  def index
    # Bu satır, Rails'e bir JSON yanıtı göndermesini söyler.
    render json: { message: "Hello World! Welcome to the SDP API." }
  end
end