module Api
  module V1
    class SuperclassController < ApplicationController
    end
    class TaggedController < SuperclassController
      swagger_controller :groups, "Group Management", tags: ['admin']

      swagger_api :show do
        summary "Fetches a single Group"
        param :path, :id, :integer, :optional, "Group Id"
        response :unauthorized
        response :not_acceptable
        response :not_found
      end

      swagger_api :create, tags: ['superadmin'] do
        summary "Creates a new Group"
        consumes [ "application/json", "text/xml" ]
        param :form, :name, :string, :required, "Group Name"
        param_list :form, :role, :string, :required, "Role", [ "admin", "superadmin", "user" ]
        response :unauthorized
        response :not_acceptable
      end
    end
  end
end
