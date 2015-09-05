class AddCommentsFilter < ActiveRecord::Migration
  def change
  	add_column :comments, :filtered, :boolean, :default => false
  end
end
