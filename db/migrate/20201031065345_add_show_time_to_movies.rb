class AddShowTimeToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :show_time, :datetime 
  end
end
