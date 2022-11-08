class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, foreign_key: 'user_id'
  has_many :foods, foreign_key: 'user_id'

  validates :name, presence: true
end
