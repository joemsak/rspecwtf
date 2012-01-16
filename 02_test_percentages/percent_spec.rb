describe "displaying the correct discount percentage" do
  def discount_for(new_price)
    "#{100 - (new_price / 100.00 * 100).to_i}%"
  end

  context "when the price is 50 cents" do
    it "displays 50%" do
      discount_for(50).should eq('50%')
    end
  end

  context "when the price is 25 cents" do
    it "displays 75%" do
      discount_for(25).should eq('75%')
    end
  end
end
