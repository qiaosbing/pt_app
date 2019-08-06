json.extract! user_desc, :id, :user_id, :user_name, :phone, :mailbox, :units, :remark, :created_at, :updated_at
json.url user_desc_url(user_desc, format: :json)
