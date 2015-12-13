class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :step1, :datetime, default: Time.now
    add_column :users, :step2, :datetime, default: Time.now
    add_column :users, :step3, :datetime, default: Time.now
    add_column :users, :step4, :datetime, default: Time.now
    add_column :users, :step5, :datetime, default: Time.now
  end
end
