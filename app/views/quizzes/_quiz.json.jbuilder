json.extract! quiz, :id, :pass_points, :time_in_seconds, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)