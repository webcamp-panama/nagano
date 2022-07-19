class Genre < ApplicationRecord

    has_many :item, dependent: :destroy
    validates :name, presence:true, length:{maximum:20}

end
