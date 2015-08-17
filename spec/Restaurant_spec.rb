require('spec_helper')

describe(Restaurant) do
  restaurant_var = {:name => 'McGraths',
                    :location => 'United States',
                    :phone => 541555678,
                    :id => nil
                    }

  describe('.all') do
    it('will return an empty array') do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe('#.==') do
    it("is the same restaurant if all the components are the same") do
      restaurant_won = Restaurant.new(restaurant_var)
      restaurant_too = Restaurant.new(restaurant_var)
      expect(restaurant_won).to(eq(restaurant_too))
    end
  end

  describe('#save') do
    it('will save a restaurant to the database') do
      test_restaurant = Restaurant.new(restaurant_var)
      test_restaurant.save()
      expect(Restaurant.all()).to(eq([test_restaurant]))
    end
  end

  describe("#id") do
    it('will tell you its id!') do
      test_restaurant = Restaurant.new(restaurant_var)
      test_restaurant.save()
      expect(test_restaurant.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
