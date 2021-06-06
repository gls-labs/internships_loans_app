# frozen_string_literal: true

# ActiveRecord model for loan_types table
class LoanType < ApplicationRecord
  has_and_belongs_to_many :documents, table_name: :loan_type_documents

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
