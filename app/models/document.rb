# frozen_string_literal: true

# ActiveRecord model for documents table
class Document < ApplicationRecord
  belongs_to :parent, class_name: 'Document', optional: true,
                      inverse_of: :children
  has_many :children, class_name: 'Document', dependent: :destroy,
                      inverse_of: :parent

  has_one_attached :file

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
