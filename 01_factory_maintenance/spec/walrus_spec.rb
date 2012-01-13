require 'factory_girl'
require 'active_model'

FactoryGirl.define do
  factory :walrus do
    id 1
    name "Wooly"
  end
end

class Walrus
  include ActiveModel::Validations
  attr_accessor :id, :name

  validates :id, :numericality => true
  validates :name, :presence => true
end

describe Walrus do
  it "rejects an invalid id number" do
    Factory.build(:walrus, :id => 'words').should_not be_valid
  end

  it "accepts a valid id number" do
    Factory.build(:walrus, :id => 1).should be_valid
  end

  it "requires a name" do
    Factory.build(:walrus, :name => nil).should_not be_valid
  end
end
