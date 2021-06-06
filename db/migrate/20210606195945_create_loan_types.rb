# frozen_string_literal: true

# Creates the loan_types table
class CreateLoanTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
