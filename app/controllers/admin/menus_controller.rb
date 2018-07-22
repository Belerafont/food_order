class Admin::MenusController < Admin::AppController

  def new
    @menu = Menu.find_by(date: Date.today)
    @menu ||= Menu.new
  end

  def create
    menu = Menu.new
    new_dish_items = DishItems::Base.where(id: menu_params[:dish_item_ids])

    ActiveRecord::Base.transaction do
      menu.save!

      menu.insert_dish_items!(new_dish_items.pluck(:id))
    end

    redirect_to menus_path,  notice: 'Menu successfully created'
  end

  def update
    menu = Menu.find(params[:id])
    new_dish_items = DishItems::Base.where(id: menu_params[:dish_item_ids])

    menu.insert_dish_items!(new_dish_items.pluck(:id))

    redirect_to menus_path
  end

  private

  def menu_params
    params.permit(dish_item_ids:[])
  end
end