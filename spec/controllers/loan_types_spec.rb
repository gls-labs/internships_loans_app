# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanTypesController, type: :controller do
  describe 'GET index' do
    before(:each) do
      create_list(:loan_type, 4, :with_documents)
      get :index
    end

    context 'assigns @loan_types' do
      let(:loan_types) { assigns(:loan_types) }

      it 'as a collection' do
        expect(loan_types).to respond_to(:to_a)
      end

      it 'as a collection of LoanType objects' do
        expect(loan_types).to all(be_instance_of LoanType)
      end
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'returns a OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET new' do
    before(:each) do
      build(:loan_type)
      get :new
    end

    context 'assigns @loan_type' do
      let(:loan_type) { assigns(:loan_type) }

      it 'as a new instance LoanType' do
        expect(loan_type).to be_a_new(LoanType)
      end
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end

    it 'returns a OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET edit' do
    before(:each) do
      ltype = create(:loan_type, :with_documents)
      get :edit, params: { id: ltype.id }
    end

    context 'assigns @loan_type' do
      let(:loan_type) { assigns(:loan_type) }

      it 'as a LoanType instance' do
        expect(loan_type).to be_instance_of(LoanType)
      end

      it 'as a existent loan type' do
        expect(loan_type.persisted?).to be true
      end
    end

    it 'renders edit template' do
      expect(response).to render_template(:edit)
    end

    it 'returns a OK status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
