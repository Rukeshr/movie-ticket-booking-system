class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.string :director 
      t.text :actors
      t.text :movie_type

      t.timestamps
    end
  end
end
