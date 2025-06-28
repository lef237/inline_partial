# frozen_string_literal: true

module InlinePartial
  module Helper
    def inline_partial(name, &block)
      raise ArgumentError, "partial name must be present (not nil)" if name.nil?

      @_inline_partials ||= {}
      @_inline_partials[name] = block if block
      nil
    end

    def render_inline_partial(name, object = nil, collection: nil)
      raise ArgumentError, "partial name must be present (not nil)" if name.nil?

      if collection
        safe_join(collection.map do |item|
          render_inline_partial(name, item)
        end)
      else
        partial = @_inline_partials&.[](name)
        raise ArgumentError, "inline partial :#{name.inspect} not found" unless partial

        capture(object, &partial)
      end
    end
  end
end
