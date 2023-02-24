class Comment < ApplicationRecord
  validates_presence_of :title, :body, :user_id, :property_id

  belongs_to :user
  belongs_to :property
end
