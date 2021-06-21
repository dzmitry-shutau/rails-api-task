# frozen_string_literal: true

class CreateStockService
  def initialize(stock_name:, bearer_name:)
    @stock_name = stock_name
    @bearer_name = bearer_name
    @errors = []
    @stock = nil
  end

  attr_reader :stock, :errors

  def call
    Stock.transaction do
      bearer = Bearer.find_or_create_by!(name: @bearer_name)
      @stock = Stock.create!(name: @stock_name, bearer: bearer)
    end
  rescue ActiveRecord::RecordInvalid => error
    @errors << error
  end
end
