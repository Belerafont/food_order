module Orders
  class CreateService

    def initialize(params, user)
      @params = params
      @user = user
    end

    def first_dish
      @first_dish ||= DishItems::Base.find_by(name: @params[:first])
    end

    def main_dish
      @main_dish ||= DishItems::Base.find_by(name: @params[:main])
    end

    def drink_dish
      @drink_dish ||= DishItems::Base.find_by(name: @params[:drink])
    end

    def order_price
      first_dish.price + main_dish.price + drink_dish.price
    end

    def call
      Order.create(first: first_dish.name, main: main_dish.name,
       drink: drink_dish.name, price: order_price, user_id: @user.id)
    end
  end
end