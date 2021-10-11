class Task < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 75 }
  validates :details, length: { maximum: 1000 }
end
