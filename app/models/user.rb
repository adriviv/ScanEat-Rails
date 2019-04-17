class User < ApplicationRecord
  has_many :scans
  has_many :favorites
  has_many :foods, through: :scan
  has_many :foods, through: :favorite

  validates :iv, :encryptedData, presence: true
end
