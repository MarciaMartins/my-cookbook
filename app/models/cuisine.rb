class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: 'Você deve preencher todos os campos' }
  end
