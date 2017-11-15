# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"

module Decidim
  module Polis
    # Decidim's Polis Rails Admin Engine.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Polis::Admin

      paths["db/migrate"] = nil

      initializer "decidim_admin_polis.mount_routes" do |_app|
        Decidim::Core::Engine.routes do
          mount Decidim::Polis::AdminEngine => "/admin/polis"
        end
      end

      routes do
        get '/show', to: 'polis#show' # route available in decidim_polis_admin.show_path
        root to: "polis#index" # route available in decidim_polis_admin.root_path
      end

      initializer "decidim_polis.admin_assets" do |app|
        app.config.assets.precompile += %w(admin/decidim_polis_manifest.js)
      end

      initializer "decidim_polis.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.admin_abilities += [
            "Decidim::Polis::Abilities::Admin::AdminAbility"
          ]
        end
      end

      initializer "decidim_polis.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("menu.polis", scope: "decidim.admin"),
            decidim_polis_admin.root_path,
            icon_name: "graph",
            position: 7.5,
            active: :inclusive,
            if: can?(:read, current_organization)
        end
      end
    end
  end
end
