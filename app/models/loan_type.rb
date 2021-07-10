# frozen_string_literal: true
class LoanType < ApplicationRecord
  has_and_belongs_to_many :documents, join_table: :loan_type_documents,
                                      dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :document_ids, presence: true
end

# == Schema Information
#
# Table name: loan_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
