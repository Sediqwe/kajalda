class ReceptConnect < ApplicationRecord
  belongs_to :recept
  belongs_to :material
  belongs_to :size
end
