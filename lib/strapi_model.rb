# frozen_string_literal: true
require "active_support"
require "active_support/rails"

require_relative "strapi_model/version"
module StrapiModel
  extend ActiveSupport::Autoload

  autoload :Query
end
