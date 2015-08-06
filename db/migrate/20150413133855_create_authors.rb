class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :post

      t.timestamps null: false
    end
  end
end
