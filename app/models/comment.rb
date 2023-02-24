class Comment < ApplicationRecord
  include RecordHistoryConcern

  validates_presence_of :title, :body, :user, :property
  belongs_to :user
  belongs_to :property
  has_many :history_items, as: :historicizable

end
