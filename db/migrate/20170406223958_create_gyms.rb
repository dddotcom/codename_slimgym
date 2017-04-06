class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.boolean :isPayableInCash
      t.integer :rateYear
      t.integer :rateMonth

      t.timestamps
    end
  end
end
