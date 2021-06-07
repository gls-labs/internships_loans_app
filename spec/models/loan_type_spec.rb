# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanType, type: :model do
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

    context 'without a name' do
      it 'has a name related error' do
        expect(subject.errors).to have_key(:name)
      end
    end

    context 'without an associated document' do
      it 'has a document related error' do
        expect(subject.errors).to have_key(:document_ids)
      end
    end

    context 'with all valid attributes' do
      let(:file) { File.open('spec/models/sample.pdf') }
      let(:document) do
        doc = Document.new(title: 'Example document')
        doc.file.attach(io: file, filename: 'sample.pdf')
        doc.tap(&:save!)
      end

      before(:each) do
        attrs = { name: 'Example loan type', document_ids: [document.id] }
        subject.assign_attributes(attrs)
      end

      it 'is valid' do
        expect(subject.valid?).to be true
      end

      it 'has a name' do
        expect(subject.name.present?).to be true
      end

      it 'has an associated document' do
        expect(subject.document_ids.any?).to be true
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
