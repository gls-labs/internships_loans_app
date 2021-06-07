# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    title { 'Example document' }

    trait :with_file do
      after :build do |document|
        file = File.open('spec/factories/sample.pdf')
        document.file.attach(io: file, filename: 'sample.pdf')
      end
    end
  end
end
