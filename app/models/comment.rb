class Comment < ApplicationRecord
  validates_presence_of :title, :body, :user, :property
  belongs_to :user
  belongs_to :property
end
