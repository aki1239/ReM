class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string    :title,     null: false
      t.text      :text,      null: false
      t.integer   :genre_id,  null: false
      t.string    :phrase,    null: false
      t.integer   :user_id,   foreign_key: true, null: false
      t.timestamps
    end
  end
end
