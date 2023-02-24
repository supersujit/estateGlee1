class Property < ApplicationRecord
  validates_presence_of :title, :address_line1, :city, :zip
  has_many :comments
  has_many :history_items

  def display_address
    "#{address_line1}, #{city}"
  end
end
