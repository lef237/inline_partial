# frozen_string_literal: true

module InlinePartial
  class Railtie < Rails::Railtie
    initializer "inline_partial.helper" do
      ActiveSupport.on_load(:action_view) do
        include InlinePartial::Helper
      end
    end
  end
end
