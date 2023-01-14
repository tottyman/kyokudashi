class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.integer :user_id, null: false
      t.integer :band_id, null: false
      t.string :music_name, null: false
      t.integer :music_time, null: false
      t.boolean :status, null: false, default: false
      t.timestamps
    end
  end
end
