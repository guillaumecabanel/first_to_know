class Search < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :offers, dependent: :destroy

  validates :query, :zip_code, presence: true
end
