class AddLoginAttemptsToUser < ActiveRecord::Migration
  def change
    add_column :users, :failed_login_attempts, :integer
    add_column :users, :last_login_attempt, :timestamp
  end
end
