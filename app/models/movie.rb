class Movie < ApplicationRecord
  belongs_to :director

  # searchkick

  include PgSearch::Model
  # multisearchable against: [:title, :syllabus]

                    # name of the method we will call
  pg_search_scope :search_by_title_and_syllabus,
    against: [ :title, :syllabus ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      # allows partial words
      tsearch: { prefix: true }
    }
end
