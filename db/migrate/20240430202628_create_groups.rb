class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.integer :name
      t.integer :parent_id
      t.timestamps
    end
  end
end
