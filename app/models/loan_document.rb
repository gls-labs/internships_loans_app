# frozen_string_literal: true
class LoanDocument < ApplicationRecord
  belongs_to :loan
  belongs_to :document

  has_one_attached :file

  validates :approved, inclusion: [true, false]
end

# == Schema Information
#
# Table name: loan_documents
#
#  id          :bigint           not null, primary key
#  loan_id     :bigint
#  document_id :bigint
#  approved    :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
