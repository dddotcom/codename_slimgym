class CreatePaycycles < ActiveRecord::Migration[5.0]
  def change
    create_table :paycycles do |t|
      t.string :name

      t.timestamps
    end
  end
end
