class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer, optional: true
  belongs_to :merchant, optional: true

  def processable?
    transactions.any? do |transaction|
      transaction[:result] == "success"
    end
  end

end
