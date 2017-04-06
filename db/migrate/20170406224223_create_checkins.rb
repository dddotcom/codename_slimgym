class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.datetime :timeIn
      t.datetime :timeOut
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
