class AddConfirmableToCustomer < ActiveRecord::Migration
  def change
    ## Confirmable
       add_column :customers, :confirmation_token, :string
       add_column :customers, :confirmed_at, :datetime
       add_column :customers, :confirmation_sent_at, :datetime
       add_column :customers, :unconfirmed_email, :string 
  end
end
