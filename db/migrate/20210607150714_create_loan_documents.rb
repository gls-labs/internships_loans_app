# frozen_string_literal: true

# Creates join table for loans & documents association
class CreateLoanDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_documents do |t|
      t.references :loan, foreign_key: true, index: true
      t.references :document, foreign_key: true, index: true
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
