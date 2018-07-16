module Orders
  class ListService

    def today
      @today ||= Date.current.strftime('%A')
    end

    def days
      @days ||= Date::DAYNAMES
    end

    def today_index
      @today_index ||= days.index(today)
    end

    def menu_days
      @menu_days ||= days.rotate(today_index + 1)
    end


    def call
      @menus = Menu.where('created_at >= ?', 1.week.ago)
      return @menus, menu_days
    end
  end
end