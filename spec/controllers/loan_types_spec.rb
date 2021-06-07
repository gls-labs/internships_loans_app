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
    let(:ltype) { create(:loan_type, :with_documents) }
    before(:each) do
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

  describe 'POST create' do
    context 'saves new record' do
      context 'with invalid parameters' do
        before(:each) do
          post :create, params: { loan_type: { name: nil } }
        end

        it 'renders new template' do
          expect(response).to render_template(:new)
        end

        it 'sets an error flash message' do
          expect(flash.to_hash).to have_key('error')
        end
      end

      context 'with valid parameters' do
        let(:ltype) { build(:loan_type, :with_documents) }
        let(:loan_type) { assigns(:loan_type) }
        let(:ltype_attrs) do
          { name: ltype.name, document_ids: ltype.document_ids }
        end

        before(:each) do
          post :create, params: { loan_type: ltype_attrs }
        end

        it 'has not validation errors' do
          expect(loan_type.errors).to be_empty
        end

        it 'redirects to index page' do
          expect(response).to redirect_to(loan_types_path)
        end

        it 'sets an success flash message' do
          expect(subject.flash.to_hash).to have_key('success')
        end
      end

      it 'returns a OK status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH update' do
    context 'updates the record' do
      let(:ltype) { create(:loan_type, :with_documents) }

      context 'with invalid parameters' do
        before(:each) do
          patch :update, params: { id: ltype.id, loan_type: { name: nil } }
        end

        it 'renders edit template' do
          expect(response).to render_template(:edit)
        end

        it 'sets an error flash message' do
          expect(flash.to_hash).to have_key('error')
        end
      end

      context 'with valid parameters' do
        let(:loan_type) { assigns(:loan_type) }
        let(:ltype_attrs) do
          { name: ltype.name, document_ids: ltype.document_ids }
        end

        before(:each) do
          patch :update, params: { id: ltype.id, loan_type: ltype_attrs }
        end

        it 'has not validation errors' do
          expect(loan_type.errors).to be_empty
        end

        it 'redirects to index page' do
          expect(response).to redirect_to(loan_types_path)
        end

        it 'sets an success flash message' do
          expect(subject.flash.to_hash).to have_key('success')
        end
      end

      it 'returns a OK status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:ltype) { create(:loan_type, :with_documents) }
    let(:loan_type) { assigns(:loan_type) }

    before(:each) do
      delete :destroy, params: { id: ltype.id }
    end

    context 'assigns @loan_type' do
      it 'as a LoanType instance' do
        expect(loan_type).to be_instance_of(LoanType)
      end
    end

    it 'removes the record from database' do
      expect(loan_type.persisted?).to be false
    end

    it 'redirects to index page' do
      expect(response).to redirect_to(loan_types_path)
    end

    it 'sets an info flash message' do
      expect(subject.flash.to_hash).to have_key('info')
    end
  end
end
