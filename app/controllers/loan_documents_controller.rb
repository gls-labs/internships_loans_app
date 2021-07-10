class LoanDocumentsController < ApplicationController
  before_action :find_loan_document, only: [:edit, :update]

  def edit;end

  def update
    if @loan_document.update(document_params)
      flash[:success] = 'Document updated successfully'
      redirect_to loan_path(@loan_document.loan.id)
    else
      flash.now[:error] = 'Error updating the document'
      render :edit
    end
  end

  private

  def document_params
    params.require(:loan_document).permit(:file, :status)
  end

  def find_loan_document
    @loan_document = LoanDocument.find(params[:id])
  end
end
