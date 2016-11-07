class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  # has_one :category
  # for length specification use this syntax
  validates :title, :text, presence: true, length: { minimum: 5, maximum: 2000}

  def self.search(search)
    where("title LIKE ? OR category LIKE ? OR text LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end