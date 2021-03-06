require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new("Crepe", 18, "Marcel")}
  let(:chef) { double("chef") }

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("Crepe")
    end


    it "sets a quantity" do
      expect(dessert.quantity).to eq (18)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq ([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("tigerbread", "lionel", "Antoni")}.to raise_error(ArgumentError)
      end
    end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("cucumber")
      expect(dessert.ingredients).to include("cucumber")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("horseradish")
      dessert.add_ingredient("pineapple")
      dessert.add_ingredient("spicy beef")
      expect(dessert.mix!).to_not eq(["flour", "horseradish", "pineapple", "spicy beef"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(4)).to eq(14)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(2700)}.to raise_error("not enough left!")
  end
end
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Marcel")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow("chef").to receive(:dessert)
    end
  end
end
