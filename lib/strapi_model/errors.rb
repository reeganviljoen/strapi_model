module Strapi
  module Errors
    class StrapiError < StandardError; end
    class RecordNotFound < StrapiError; end
    class ServerError < StrapiError; end
    class AuthenticationError < StrapiError; end
    class ForbiddenError < StrapiError; end
    class BadRequestError < StrapiError; end
    class UnprocessableEntityError < StrapiError; end
    class UnknownError < StrapiError; end
  end
end
