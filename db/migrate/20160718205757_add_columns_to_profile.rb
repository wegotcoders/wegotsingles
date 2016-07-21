class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :customer
  end
end
