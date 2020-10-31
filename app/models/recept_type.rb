class ReceptType < ApplicationRecord
    belongs_to :recept, :optional => true
end
