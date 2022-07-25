class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    enum making_status: { unmakeble: 0, makig_waiting: 1, making: 2, making_complete: 3}

     def subtotal
     (price * 1.1).floor * quantity
     end

end
