# frozen_string_literal: true

# Controller actions for loan_types
class LoanTypesController < ApplicationController
  before_action :set_loan_type, except: %i[index new create]

  def index
    @loan_types = LoanType.all
  end

  # def show; end

  def new
    @loan_type = LoanType.new
  end

  private

  def set_loan_type
    @loan_type = LoanType.find(params[:id])
  end
end
