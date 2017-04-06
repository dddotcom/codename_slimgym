class AddUsersAgain < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :dividend
      t.references :gym, foreign_key: true
      t.integer :paycycle
      t.integer :streak

      t.timestamps
    end
  end
end
