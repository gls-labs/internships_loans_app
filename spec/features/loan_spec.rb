require 'rails_helper'

RSpec.feature 'Loans', js: true do
  let!(:documents) { create(:document, :with_file) }
  let!(:loan_type) { create(:loan_type, :with_documents) }
    
  feature 'Go to loans page' do
    scenario 'Exist an loan' do
      visit loans_path

      expect(page).to have_text('Loans')
    end
  end

  feature 'Go to loans page' do
    let!(:loan) { create(:loan) }

    scenario 'Exist an loan' do
      visit loans_path

      expect(page).to have_text('Loans')
      expect(page).to have_text(loan.amount)
    end
  end
end