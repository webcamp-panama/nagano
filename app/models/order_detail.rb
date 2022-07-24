class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    enum making_status: { not_startable: 0, waiting_making: 1, in_making: 2, making_complete: 3 }

     def subtotal
     (price * 1.1).floor * quantity
     end

end
