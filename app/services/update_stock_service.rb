# frozen_string_literal: true

class UpdateStockService
  def initialize(stock:, new_stock_name:, bearer_name:)
    @new_stock_name = new_stock_name
    @bearer_name = bearer_name
    @stock = stock
    @errors = []
  end

  attr_reader :stock, :errors

  def call
    Stock.transaction do
      if @bearer_name.present?
        bearer = Bearer.find_or_create_by!(name: @bearer_name) if @bearer_name.present?
      else
        bearer = @stock.bearer
      end
      @stock.update!(name: @new_stock_name, bearer: bearer)
    end
  rescue ActiveRecord::RecordInvalid => error
    @errors << error
  end
end
