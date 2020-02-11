require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    described_class.new(name: "new product", description: "good product", category: Category.new, quantity: 1, price_cents: 10)
  }

  describe "Validations" do
    
    it "is valid with all 4 fields" do
      expect(subject).to be_valid
    end
    # validates :name, presence: true
    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to_not be_empty
    end
    # validates :price, presence: true
    it "is not valid without price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to_not be_empty
    end
    # validates :quantity, presence: true
    it "is not valid without quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to_not be_empty
    end
    # validates :category, presence: true
    it "is not valid without category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to_not be_empty
    end
  end
end
