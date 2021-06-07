# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'when is new record' do
    before(:each) { subject.validate }

    context 'with invalid attributes' do
      it 'is invalid' do
        expect(subject.invalid?).to be true
      end

      it 'has errors' do
        expect(subject.errors).to_not be_empty
      end
    end

    context 'without a title' do
      it 'has a title related error' do
        expect(subject.errors).to have_key(:title)
      end
    end

    context 'without a attached file' do
      it 'has a file related error' do
        expect(subject.errors).to have_key(:file)
      end
    end

    context 'with all valid attributes' do
      subject { build(:document, :with_file) }

      it 'is valid' do
        expect(subject.valid?).to be true
      end

      it 'has a title' do
        expect(subject.title.present?).to be true
      end

      it 'has a attached file' do
        expect(subject.file.attached?).to be true
      end

      context 'is saved' do
        before(:each) { subject.save }
        it 'is persisted' do
          expect(subject.persisted?).to be true
        end
      end
    end
  end
end
