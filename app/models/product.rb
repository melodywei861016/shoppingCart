class Product < ApplicationRecord
  validates :title, presence: true
  has_many :items, class_name: 'OrderItem'
end
