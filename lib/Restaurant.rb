class Restaurant

  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name     = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone    = attributes.fetch(:phone)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurant;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch("name")
      location = restaurant.fetch("location")
      phone = restaurant.fetch("phone").to_i()
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone, :id => nil}))
    end
    restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurant (name, location, phone) VALUES ('#{@name}', '#{@location}', #{@phone}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_restaurant|
    self.name().==(another_restaurant.name()).&(self.location().==(another_restaurant.location())).&(self.phone().==(another_restaurant.phone()))
  end

end
