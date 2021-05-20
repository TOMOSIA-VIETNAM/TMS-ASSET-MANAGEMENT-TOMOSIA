module ItemsHelper
    def dataItemNotUsed
        @items_not_used = Item.where(status: 1)
    end
end
