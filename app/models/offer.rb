class Offer < ApplicationRecord
  belongs_to :search

  monetize :price_cents
end
