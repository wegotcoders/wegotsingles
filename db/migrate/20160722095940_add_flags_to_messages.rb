class AddFlagsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read, :boolean
    add_column :messages, :visible, :boolean
  end
end
