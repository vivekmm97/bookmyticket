json.extract! movie, :id, :name, :language, :screen_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
