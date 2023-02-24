module RecordHistoryConcern
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      after_save :create_history_item
    end
  end

  def create_history_item
    self.property.history_items.create(historicizable: self)
  end

end
