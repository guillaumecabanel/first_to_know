class Search < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :offers

  validates :query, :zip_code, presence: true
end
