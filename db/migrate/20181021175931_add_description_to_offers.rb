class AddDescriptionToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :description, :string
  end
end
