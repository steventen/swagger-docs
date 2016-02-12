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
        param :form, :rank, :integer, :optional, "Group Rank", tags: ['boss']
        param :body, :setting, :setting, :required, "Group Settings"
        response :unauthorized
        response :not_acceptable
      end

      swagger_model :setting do
        description "Group Settings"
        property :list, :string, :required, "The type of Access Control",
                 enum: %w(whitelist blacklist)
        property :category, :string, :optional,
                 "The category of Group",
                 enum: %w(adult child), tags: ['boss']
        property :expires, :string, :optional,
                 "RFC 3339 timestamp when the change expires",
                 format: 'date-time', tags: ['boss']
      end
    end
  end
end
