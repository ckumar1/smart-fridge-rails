require 'spec_helper'

describe Recipe do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:recipe)).to be_valid
  end

  context 'is valid' do
    let (:valid_recipe) { build(:recipe) }
    let (:noteless_recipe) { build(:recipe, notes: '') }

    it 'with a name and directions' do
      expect(valid_recipe).to be_valid
    end

    it 'without notes' do
      expect(noteless_recipe).to be_valid
    end
  end

  context 'is invalid' do
    let (:recipe_without_name) { build :recipe, name: '' }
    let (:recipe_without_directions) { build :recipe, directions: '' }
    let (:recipe_with_long_name) { build(:recipe, name: 'a'*81) }

    it 'without a name' do
      expect(recipe_without_name).to_not be_valid
    end
    it 'without directions' do
      expect(recipe_without_directions).to_not be_valid
    end
    it 'if name is longer than 80 characters' do
      expect(recipe_with_long_name).to_not be_valid
    end
  end

end
