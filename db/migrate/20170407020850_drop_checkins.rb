class DropCheckins < ActiveRecord::Migration
 def up
   drop_table :checkins
 end

 def down
   fail ActiveRecord::IrreversibleMigration
 end
end