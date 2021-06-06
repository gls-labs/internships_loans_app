# frozen_string_literal: true

# Creates the table for the documents
class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.references :parent, null: false, foreign_key: { to_table: :documents }

      t.timestamps
    end
  end
end
