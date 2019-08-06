require 'grape'
require 'grape-swagger'

class TestV1API < Grape::API
  format :json

  mount UserV1Api => "user" #用户登录

  add_swagger_documentation base_path: '/api/v1', hide_format: true
end