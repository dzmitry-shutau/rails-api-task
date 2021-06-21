require "rails_helper"

describe "Stocks API", type: :request do
  it "returns all stocks" do
    2.times { FactoryBot.create(:stock) }

    get("/stocks")

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq 2
  end
end
