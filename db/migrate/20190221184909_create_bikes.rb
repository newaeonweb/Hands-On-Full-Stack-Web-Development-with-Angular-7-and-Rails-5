class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :items

      t.timestamps
    end
  end
end
