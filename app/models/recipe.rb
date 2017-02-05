class Recipe < ApplicationRecord
  belongs_to :category, optional: true
	validates :title, :ingredients, :instructions, presence: true
  validates :title, uniqueness: { message: "must be unique" }
  has_many :categories
end
