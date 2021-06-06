# frozen_string_literal: true

# Remove null constraint from documents parent_id
class RemoveNullConstraintFromDocumentsParentId < ActiveRecord::Migration[6.1]
  def change
    change_column :documents, :parent_id, :bigint, null: true
  end
end
