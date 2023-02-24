class Property < ApplicationRecord
  validates_presence_of :title, :address_line1, :city, :zip
  belongs_to :user
  has_many :comments
  has_many :history_items
  has_many :status_updates

  def display_address
    "#{address_line1}, #{city}"
  end
end
