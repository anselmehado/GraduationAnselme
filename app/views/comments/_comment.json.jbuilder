json.extract! comment, :id, :content, :email, :name, :created_at, :updated_at
json.url comment_url(comment, format: :json)
