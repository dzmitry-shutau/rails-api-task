# frozen_string_literal: true

class StocksController < ApplicationController
  before_action :set_stock, only: [:update, :destroy]

  # GET /stocks
  def index
    @stocks = Stock.all

    render json: @stocks
  end

  # POST /stocks
  def create
    service = CreateStockService.new(stock_name: stock_params[:name], bearer_name: bearer_params[:name])
    service.call
    stock = service.stock

    if stock
      render json: stock, status: :created, location: stock
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stocks/1
  def update
    service = UpdateStockService.new(
      stock: @stock,
      new_stock_name: stock_params[:name],
      bearer_name: params.dig(:bearer, :name)
    )
    service.call
    stock = service.stock

    if service.errors.any?
      render json: service.errors, status: :unprocessable_entity
    else
      render json: stock, status: :ok, location: stock
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.soft_delete!

    if @stock.errors.any?
      render json: { status: :unprocessable_entity, message: @stock.errors }
    else
      render json: { status: :ok, message: I18n.t("stocks.destroy.success_message") }
    end
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:name)
  end

  def bearer_params
    params.require(:bearer).permit(:name)
  end
end
