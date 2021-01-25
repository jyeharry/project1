class AddBarIdToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :bar_id, :text
  end
end
