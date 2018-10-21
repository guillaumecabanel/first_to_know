class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :url
      t.string :lbc_id
      t.references :search, foreign_key: true

      t.timestamps
    end
  end
end
