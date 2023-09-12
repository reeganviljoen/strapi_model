require 'http'
require 'json'
require 'strapi_model/errors'

module StrapiModel
  class Query
    class << self
      def get(api_id = '', params = '', entry_id= nil)
        if entry_id.present?
          response = http.get("#{host}/api/#{api_id}/#{entry_id}?#{params}")
        else
          response = http.get("#{host}/api/#{api_id}?#{params}")
        end
        response.code == 404 ? raise(Strapi::Errors::RecordNotFound) : JSON.parse(response.to_s, symbolize_names: true)
      end

      private

      def http
        HTTP.auth("Bearer #{access_token}")
      end

      def access_token
        ENV['STRAPI_ACCES_TOKEN']
      end

      def host
        ENV['STRAPI_HOST']
      end
    end
  end
end
