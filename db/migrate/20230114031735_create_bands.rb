class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :band_name, null: false
      t.integer :mike_number, null: false
      t.text :other
      t.integer :linenumber, null: false
      t.timestamps
    end
  end
end
