class MaterialCategory < ApplicationRecord
    belongs_to :material, :optional => true
end
