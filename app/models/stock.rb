class Stock < ApplicationRecord
  belongs_to :bearer

  validates :name, presence: true
end
