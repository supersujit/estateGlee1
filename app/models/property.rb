class Property < ApplicationRecord
  validates_presence_of :title, :address_line1, :city, :zip
  enum status: [:listed, :viewing, :financing, :payment, :sold]

  def display_address
    "#{address_line1}, #{city}"
  end
end
