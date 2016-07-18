class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
