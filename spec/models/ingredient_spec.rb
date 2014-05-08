require 'spec_helper'

describe Ingredient do

  let (:rcp) { create :recipe }

  it "has a valid factory" do
    expect(FactoryGirl.build(:ingredient, recipe: rcp)).to be_valid
  end

  context 'is valid' do
    let (:valid_ingredient) { build(:ingredient) }

    it 'with a name and quantity' do
      expect(valid_ingredient).to be_valid
    end
  end

  context 'is invalid' do
    let (:ingredient_without_name) { build :ingredient, name: '' }
    let (:ingredient_without_quantity) { build :ingredient, quantity: '' }
    let (:lengthy_ingredient) { build(:ingredient, name: 'a'*51) }

    it 'without a name' do
      expect(ingredient_without_name).to_not be_valid
    end
    it 'without a quantity' do
      expect(ingredient_without_quantity).to_not be_valid
    end
    it 'if name is longer than 50 characters' do
      expect(lengthy_ingredient).to_not be_valid
    end
  end

end
