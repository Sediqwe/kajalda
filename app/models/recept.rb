class Recept < ApplicationRecord
  belongs_to :recept_type, optional: true
end
