class AddLoginLockoutInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked, :boolean, :default => false
  end
end
