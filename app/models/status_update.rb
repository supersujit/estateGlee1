class StatusUpdate < ApplicationRecord
  include RecordHistoryConcern

  belongs_to :property
  has_many :history_items, as: :historicizable

end
