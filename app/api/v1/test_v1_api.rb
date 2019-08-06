require 'grape'
require 'grape-swagger'

class TestV1API < Grape::API
  mount UserV1API => "user"

  add_swagger_documentation base_path: '/api/v1', hide_format: true

end