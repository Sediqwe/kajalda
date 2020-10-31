class Material < ApplicationRecord
  belongs_to :material_category, :optional => true
  belongs_to :recept_connect, :optional => true
  end
