json.extract! course, :id, :name, :no_resolution, :created_at, :updated_at
json.url course_url(course, format: :json)