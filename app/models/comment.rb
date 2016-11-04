class Comment < ApplicationRecord
  belongs_to :event
  validates :commenter, :body, presence: true, length: { minimum: 5, maximum: 2000 }
end
