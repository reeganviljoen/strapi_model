# frozen_string_literal: true
require "active_support"
require "active_support/core_ext"

require_relative "strapi_model/version"
module StrapiModel
  extend ActiveSupport::Autoload

  autoload :Base
end
