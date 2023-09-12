require 'strapi_model/query'
require 'strapi_model/relation'
require 'yard'

module StrapiModel
  class Base

    def initialize(attributes = {})
    attributes.each do |key, value|
      define_singleton_method(key.to_s.underscore.downcase) { value }
    end
  end

  class << self
    delegate :last, :first, :to => :all

    attr_writer :api_id

      def api_id
        @api_id ||= self.name.to_s.underscore.dasherize.pluralize
      end

      def all
        response = Query.get(api_id)
        set_relation(response)
      end

      def where(**params)
        query_params = 'filters'
        params.each do |key, value|
          query_params += "[#{key.capitalize()}][$eq]=#{value}"
        end
        response = Query.get(api_id, query_params)
        set_relation(response)
      end

      def find(id)
        response = Query.get(api_id, '', id)
        self.new(response[:data][:attributes])
      end

      def find_by(**params)
        query_params = 'filters'
        params.each do |key, value|
          query_params += "[#{key.capitalize()}][$eq]=#{value}"
        end
        response = Query.get(api_id, query_params)
        self.new(response[:data][0][:attributes])
      end

      private

      def set_relation(response)
        entries = []
        response[:data].each do |entry|
          entries.append(self.new(entry[:attributes]))
        end
        Relation.new(self.class_name.to_sym, entries)
      end
    end
  end
end
