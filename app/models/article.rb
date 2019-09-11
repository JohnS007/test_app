class Article < ApplicationRecord
  belongs_to :zuser #setting up one-to-many association between user and articles, article is the many side
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :zuser_id, presence: true
end
