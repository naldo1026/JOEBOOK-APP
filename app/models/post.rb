class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :position, presence: true
  validates :store_name, presence: true
  validates :story, presence: true
end
