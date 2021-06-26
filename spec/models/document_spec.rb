# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it 'contains belongs_to associations' do
      is_expected.to belong_to(:parent).optional(:true)
    end

    it 'contains has_many associations' do
      is_expected.to have_many(:children)
    end
  end

  describe 'model' do   
    subject { build(:document, :with_file) }

    describe 'validations' do
      it 'valdates model attributes' do
        is_expected.to validate_presence_of(:title)
        is_expected.to validate_presence_of(:file)

        is_expected.to validate_uniqueness_of(:title).case_insensitive
      end
    end
  end
end
