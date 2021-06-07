# frozen_string_literal: true

# ActiveRecord model for loan_documents table
class LoanDocument < ApplicationRecord
  belongs_to :loan
  belongs_to :document

  validates :approved, inclusion: [true, false]
end
