# frozen_string_literal: true

# ActiveRecord model for loans table
class Loan < ApplicationRecord
  belongs_to :loan_type
  has_many :loan_documents, dependent: :destroy, inverse_of: :loan

  enum state: { pending: 0, started: 1, completed: 2 }

  validates :state, :amount, :loan_type, presence: true
  validates :amount, numericality: true

  after_initialize :init_as_pending
  before_create :preset_documents

  def all_documents_approved?
    loan_documents.all?(&:approved)
  end

  private

  def init_as_pending
    self.state = :pending
  end

  def preset_documents
    loan_type.documents.each do |document|
      loan_documents.build(document: document)
    end
  end
end
