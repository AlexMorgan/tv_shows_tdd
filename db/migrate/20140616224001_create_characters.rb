class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, presence: true
      t.string :actor, presence: true
      t.text :description
      t.integer :television_show_id, presence: true
    end
    add_index :characters, [:name, :television_show_id], unique: true
  end
end
