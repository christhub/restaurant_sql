require('spec_helper')

describe(Food) do

  food_attributes = {:type => 'Sushi', :rating => 5, :cost => 3.58, :restaurant_id => 1}

  describe('.all') do
    it('returns array of Food, empty at first') do

      expect(Food.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('compares two objects to see if they are identical') do
      food = Food.new(food_attributes)
      food2 = Food.new(food_attributes)
      expect(food).to(eq(food2))
    end
  end

  describe('#save') do
    it('saves the shit out of a food to the database') do
      test_food = Food.new(food_attributes)
      test_food.save()
      expect(Food.all()).to(eq([test_food]))
    end
  end
end
