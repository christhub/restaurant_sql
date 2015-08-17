class Food

  attr_reader(:type, :cost, :rating, :restaurant_id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @cost = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_singleton_method(:all) do
    returned_foods = DB.exec("SELECT * FROM food;")
    foods = []
    returned_foods.each() do |food|
      type = food.fetch("type")
      cost = food.fetch("cost").to_f()
      rating = food.fetch("rating").to_i()
      restaurant_id = food.fetch("restaurant_id").to_i()
      foods.push(Food.new({:type => type, :cost => cost, :rating => rating, :restaurant_id => restaurant_id}))
    end
    foods
  end

  define_method(:==) do |another_food|
    (self.type() == another_food.type()) && (self.cost() == another_food.cost()) && (self.rating() == another_food.rating())
  end

  define_method(:save) do
    DB.exec("INSERT INTO food (type, rating, cost, restaurant_id) VALUES ('#{@type}', #{@rating}, #{@cost}, #{@restaurant_id})")
  end


end
