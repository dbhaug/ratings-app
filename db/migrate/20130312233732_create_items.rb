class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :avg_rating
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
