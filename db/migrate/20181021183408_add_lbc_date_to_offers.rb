class AddLbcDateToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :lbc_date, :datetime
  end
end
