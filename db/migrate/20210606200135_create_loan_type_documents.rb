# frozen_string_literal: true

# Creates the join table between documents & loan_types
class CreateLoanTypeDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_type_documents do |t|
      t.references :loan_type, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
