# frozen_string_literal: true

# Controller actions for loan_types
class LoanTypesController < ApplicationController
  before_action :set_loan_type, except: %i[index new create]
  before_action :set_documents, only: %i[new create edit update]

  def index
    @loan_types = LoanType.includes(:documents)
  end

  def new
    @loan_type = LoanType.new
  end

  def create
    @loan_type = LoanType.new(loan_type_params)
    if @loan_type.save
      flash[:success] = 'Loan type created successfully'
      redirect_to loan_types_path
    else
      flash.now[:error] = 'Error creating the loan type'
      render :new
    end
  end

  def edit; end

  def update
    if @loan_type.update(loan_type_params)
      flash[:success] = 'Loan type updated successfully'
      redirect_to loan_types_path
    else
      flash.now[:error] = 'Error updating the loan type'
      render :edit
    end
  end

  def destroy
    @loan_type.destroy
    flash[:info] = 'The loan type has been deleted'
    redirect_to loan_types_path
  end

  private

  def set_loan_type
    @loan_type = LoanType.includes(:documents).find(params[:id])
  end

  def set_documents
    @documents = Document.all
  end

  def loan_type_params
    params.require(:loan_type).permit(:name, document_ids: [])
  end
end
