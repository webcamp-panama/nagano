class Item < ApplicationRecord
  has_one_attached :image
  #belongs_to :cart_item
  belongs_to :genre
  has_many :cart_item

  validates :price, presence: true

  #validates is_active, inclusion: [true, false]

  ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end

   def get_image(width, height)
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/cake_about.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
   end

   def add_tax_on_price
    (self.price * 1.10).round
   end
  end
