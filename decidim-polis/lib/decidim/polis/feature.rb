# frozen_string_literal: true

require_dependency "decidim/features/namer"

Decidim.register_feature(:polis) do |feature|
  feature.engine = Decidim::Polis::Engine
  feature.icon = "decidim/polis/icon.svg"

  feature.settings(:global) do |settings|
    settings.attribute :title, type: :text
    settings.attribute :description, type: :text, editor: true
    settings.attribute :user_can_write, type: :boolean, default: false
    settings.attribute :user_can_vote, type: :boolean, default: false
    settings.attribute :visualization, type: :boolean, default: false
  end
end
