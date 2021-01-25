class CreateBarsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bars_users, :id => false do |t|
      t.integer :bar_id
      t.integer :user_id
      t.timestamps
    end
  end
end
