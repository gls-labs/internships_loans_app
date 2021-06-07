# frozen_string_literal: true

# Controller actions for home pages
class LoansController < ApplicationController
  before_action :set_loan, except: %i[index new create]

  def index
    @loans = Loan.includes(:loan_type, :loan_documents)
  end

  def show; end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      flash[:success] = 'Loan created successfully'
      redirect_to @loan
    else
      flash.now[:error] = 'Error creating the loan'
      render :new
    end
  end

  def edit; end

  def update
    if @loan.update(loan_params)
      flash[:success] = 'Loan updated successfully'
      redirect_to @loan
    else
      flash.now[:error] = 'Error updating the loan'
      render :edit
    end
  end

  def destroy
    @loan.destroy
    flash[:info] = 'The loan has been deleted'
    redirect_to loans_path
  end

  private

  def set_loan
    @loan = Loan.includes(:loan_type, :loan_documents).find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:amount, :loan_type_id)
  end
end
