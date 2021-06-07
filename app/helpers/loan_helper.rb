# frozen_string_literal: true

# View helpers for loans
module LoanHelper
  def loan_types
    @loan_types ||= LoanType.all
  end
end
