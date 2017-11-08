# frozen_string_literal: true

require_dependency "decidim/features/namer"

Decidim.register_feature(:polis) do |feature|
  feature.engine = Decidim::Polis::Engine
  feature.icon = "decidim/polis/icon.svg"
  feature.stylesheet = "decidim/polis/polis"

  feature.settings(:global) do |settings|
    settings.attribute :user_can_write, type: :boolean, default: true
    settings.attribute :user_can_vote, type: :boolean, default: true
    settings.attribute :visualization, type: :boolean, default: true
  end
end
