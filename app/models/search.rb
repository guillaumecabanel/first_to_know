class Search < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :query, :zip_code, presence: true
end
