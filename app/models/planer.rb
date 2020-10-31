class Planer < ApplicationRecord
  belongs_to :recept, optional: true
end
