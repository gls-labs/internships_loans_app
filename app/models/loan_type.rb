# frozen_string_literal: true

# ActiveRecord model for loan_types table
class LoanType < ApplicationRecord
  has_and_belongs_to_many :documents, join_table: :loan_type_documents,
                                      dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :document_ids, presence: true
end
