# frozen_string_literal: true

class Stock < ApplicationRecord
  has_soft_deletion default_scope: true

  belongs_to :bearer

  validates :name, presence: true, uniqueness: true
end
