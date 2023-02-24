class StatusUpdate < ApplicationRecord
  belongs_to :property
  has_many :history_items, as: :historicizable
end
