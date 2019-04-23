class Food < ApplicationRecord
  has_many :scans
  has_many :favorites
  has_many :users, through: :scan
  has_many :users, through: :favorite

  validates :barcode, presence: true
  validates :product_name, presence: true
  # validates :brand, presence: true
  # validates :nutrition_grade, presence: true
  # validates :ingredients, presence: true
  # validates :image_url, presence: true
  # validates :status, presence: true
end
