# frozen_string_literal: true
class Document < ApplicationRecord
  belongs_to :parent, class_name: 'Document', optional: true,
                      inverse_of: :children
  has_many :children, class_name: 'Document', dependent: :destroy,
                      inverse_of: :parent, foreign_key: :parent_id

  has_one_attached :file

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :file, attached: true
end

# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  title      :string
#  parent_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
