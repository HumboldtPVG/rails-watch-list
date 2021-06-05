class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_associated :movie
  validates_associated :list
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }
end
