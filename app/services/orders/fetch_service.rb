module Orders
  class FetchService

    def initialize(menu_id)
      @id = menu_id[:id]
    end

    def call
      Menu.find(@id)
    rescue  ActiveRecord::RecordNotFound
      raise Errors::NotFound.new
    end
  end
end