# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    name { Faker::Name.name }
    bearer { FactoryBot.create(:bearer) }
  end
end
