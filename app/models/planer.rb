class Planer < ApplicationRecord
  has_and_belongs_to_many :recepts, optional: true
end
