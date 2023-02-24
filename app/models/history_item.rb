class HistoryItem < ApplicationRecord
  belongs_to :historicizable, polymorphic: true  #historicizable: meaning an event which can or should be recordable in history
end
