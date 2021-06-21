# frozen_string_literal: true

FactoryBot.define do
  factory :bearer do
    name { Faker::Name.name }
  end
end
