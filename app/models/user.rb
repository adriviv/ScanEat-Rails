class User < ApplicationRecord
  has_many :scans, dependent: :destroy
  has_many :favorites
  has_many :foods, through: :scan
  has_many :foods, through: :favorite
  has_many :propositions


end
