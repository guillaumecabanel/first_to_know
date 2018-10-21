class AddPriceToOffers < ActiveRecord::Migration[5.2]
  def change
    add_monetize :offers, :price, currency: { present: false }
  end
end
