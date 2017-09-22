require 'jsonapi_swagger_helpers'

class DocsController < ActionController::API
  include JsonapiSwaggerHelpers::DocsControllerMixin

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Employee Directory'
      key :description, 'The <b>Employee Directory API!'
      contact do
        key :name, 'Lee Richmond'
      end
    end
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  jsonapi_resource '/v1/employees'
  jsonapi_resource '/v1/departments'
  # jsonapi_resource '/v1/list'
  jsonapi_resource '/v1/positions'
end
