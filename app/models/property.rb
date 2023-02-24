class Property < ApplicationRecord
  validates_presence_of :title, :address_line1, :city, :zip
  has_many :comments
  has_many :history_items

  enum status: [:listed, :viewing, :financing, :payment, :sold]

  def display_address
    "#{address_line1}, #{city}"
  end
end
