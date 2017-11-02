# frozen_string_literal: true

require_dependency "decidim/features/namer"

Decidim.register_feature(:polis) do |feature|
  feature.engine = Decidim::Polis::Engine
  feature.icon = "decidim/polis/icon.svg"
  feature.stylesheet = "decidim/polis/polis"
end
