class Movie < ApplicationRecord
    has_one_attached :image
    validates :movie_title,presence: true, length:{minimum:2,maximum:50}
    validates :director,presence: true
    validates :actors,presence: true 
    validates :movie_type,presence: true, length:{minimum:1,maximum:100} 

    def self.search_by(search_term)
        where("LOWER(movie_title) LIKE :search_term OR LOWER(director) LIKE :search_term OR LOWER(actors) LIKE :search_term OR LOWER(movie_type) LIKE :search_term OR LOWER(language) LIKE :search_term ", search_term: "%#{search_term.downcase}%")
    end

end