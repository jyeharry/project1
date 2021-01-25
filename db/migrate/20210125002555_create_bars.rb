class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :city
      t.text :image
      t.text :link

      t.timestamps
    end
  end
end
