module StrapiModel
  class Relation
    include Enumerable

    attr_reader :klass, :entries

    def initialize(klass, entries = [])
      @klass = klass
      @entries = entries
    end

    def each
      entries.each do |item|
        yield item
      end
    end

    def method_missing(method, *args)
      if entries.respond_to?(method)
        entries.send(method, *args)
      else
        super
      end
    end
  end
end
