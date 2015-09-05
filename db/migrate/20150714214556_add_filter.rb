class AddFilter < ActiveRecord::Migration
  def change
  	add_column :tweets, :filtered, :boolean, :default => false
  end
end
