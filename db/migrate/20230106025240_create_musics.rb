class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.integer :user_id, null: false
      t.string :song1_name, null: false
      t.integer :song1_time, null: false
      t.string :song2_name
      t.integer :song2_time
      t.string :band_name, null: false
      t.integer :mike_number, null: false
      t.boolean :status, null: false, default: false
      t.text :other
      t.timestamps
    end
  end
end
