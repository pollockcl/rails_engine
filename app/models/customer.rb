class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.joins(:invoices, :transactions)
             .merge(Transaction.success)
             .group(:id)
             .order('COUNT(transactions.id) DESC')
             .limit(1)  
             .first
  end
end
