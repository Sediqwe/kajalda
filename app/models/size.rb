class Size < ApplicationRecord
    belongs_to :material, :optional => true
    belongs_to :recept_connect, :optional => true
end
