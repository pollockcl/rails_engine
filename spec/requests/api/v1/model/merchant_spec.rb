require 'rails_helper'

describe Merchant, type: :model do
  describe "has relationships" do
    it {should have_many(:invoices)}
    it {should have_many(:items)}
  end
end