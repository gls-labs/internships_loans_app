# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    sequence(:title) { |n| "Example document #{n}" }

    trait :with_file do
      after :build do |document|
        file = File.open('spec/factories/sample.pdf')
        document.file.attach(io: file, filename: 'sample.pdf')
      end
    end
  end

  factory :loan_type do
    name { 'Example loan type' }

    trait :with_documents do
      after(:build) do |loan_type|
        docs = create_list(:document, 2, :with_file)
        loan_type.document_ids = docs.map(&:id)
      end
    end
  end
end
