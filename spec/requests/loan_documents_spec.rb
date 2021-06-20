require 'rails_helper'

RSpec.describe "LoanDocuments", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/loan_documents/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/loan_documents/show"
      expect(response).to have_http_status(:success)
    end
  end

end
