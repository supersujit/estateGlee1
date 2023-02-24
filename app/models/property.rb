class Property < ApplicationRecord
  validates_presence_of :title, :address_line1, :city, :zip
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :history_items, dependent: :destroy
  has_many :status_updates, dependent: :destroy

  after_create :create_default_status

  def current_status
    status_updates.last
  end

  def display_address
    "#{address_line1}, #{city}"
  end

  private
  def create_default_status
    self.status_updates.create(user_id: user.id, status: :listed)
  end
end
