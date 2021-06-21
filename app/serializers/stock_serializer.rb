# frozen_string_literal: true

class StockSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :created_at,
    :updated_at,
    :bearer,
  )
end
