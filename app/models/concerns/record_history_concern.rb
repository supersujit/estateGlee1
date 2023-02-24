module RecordHistoryConcern
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      has_many :history_items, as: :historicizable
      after_save :create_history_item
    end
  end

  def create_history_item
    self.property.history_items.create(historicizable: self, summary: self.history_item_summary)
  end

  def history_item_summary
    raise NotImplementedError
  end

end
