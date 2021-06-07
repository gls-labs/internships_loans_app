# frozen_string_literal: true

# Create loans table
class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :amount, null: false
      t.integer :state, null: false
      t.references :loan_type, foreign_key: true, index: true

      t.timestamps
    end
  end
end
