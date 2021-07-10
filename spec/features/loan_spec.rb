require 'rails_helper'

RSpec.feature 'Loans', js: true do
  let!(:documents) { create(:document, :with_file) }
  let!(:loan_type) { create(:loan_type, :with_documents) }
  let!(:loan) { create(:loan) }
    
  feature 'Go to loans page' do
    scenario 'Exist an loan' do
      visit loans_path

      expect(page).to have_content(loan.amount)
      expect(page).to have_content(loan.loan_type.name)
      expect(page).to have_content(loan.loan_documents.count)
    end

    scenario 'Go to details' do
      visit loans_path

      expect(page).to have_link('Details')

      click_on 'Details'

      expect(page).to have_content("Details of loan ##{loan.id}")

      expect(page).to have_content(loan.amount)
      expect(page).to have_text(/Pending/i)
      
      expect(page).to have_content('Documents')
      
      expect(page).to have_link('Download', count: 2)
      expect(page).to have_link('Upload', count: 2)
    end

    scenario 'Show upload form' do
      visit loans_path

      expect(page).to have_link('Details')

      click_on 'Details'

      expect(page).to have_content("Details of loan ##{loan.id}")

      visit edit_loan_document_path(loan.loan_documents.first.id)
      
      expect(page).to have_content(loan.loan_documents.first.approved ? 'Yes' : 'No')
    end

    scenario 'Show upload form and upload file' do
      visit loans_path

      expect(page).to have_link('Details')

      click_on 'Details'

      expect(page).to have_content("Details of loan ##{loan.id}")

      visit edit_loan_document_path(loan.loan_documents.first.id)

      attach_file 'loan_document[file]', 'spec/factories/sample.pdf'

      click_on 'Save'
      
      expect(page).to have_text('Document updated successfully')
    end
  end
end