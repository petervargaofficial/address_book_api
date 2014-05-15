class AddColumnUserToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :user, :integer
  end
end
