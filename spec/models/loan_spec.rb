# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'associations' do
    it 'contains belongs_to associations' do
      is_expected.to belong_to(:loan_type)
    end

    it 'contains has_many associations' do
      is_expected.to have_many(:loan_documents)
    end
  end

  describe 'model' do
    let!(:loan_type) { create(:loan_type, :with_documents)}
    
    subject { build(:loan, loan_type: loan_type) }

    describe 'validations' do
      it 'valdates model attributes' do
        is_expected.to validate_presence_of(:state)
        is_expected.to validate_presence_of(:amount)
        is_expected.to validate_presence_of(:loan_type)
        is_expected.to validate_numericality_of(:amount)
        is_expected.to define_enum_for(:state)
      end
    end
  end
end
