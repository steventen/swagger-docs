module Api
  module V1
    class SuperclassController < ApplicationController
    end
    class TaggedController < SuperclassController
      swagger_controller :groups, "Group Management", tags: ['admin']

      swagger_api :show do
        summary "Fetches a single group"
        param :path, :id, :integer, :optional, "Group Id"
        response :unauthorized
        response :not_acceptable
        response :not_found
      end
    end
  end
end
