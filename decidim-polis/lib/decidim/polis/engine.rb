# frozen_string_literal: true

module Decidim
  module Polis
    # This is the engine that runs on the public interface of `decidim-polis`.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Polis

      routes do
        resources :polis, only: [:index, :show]
        root to: "polis#index"
      end

      initializer "decidim_polis.assets" do |app|
        app.config.assets.precompile += %w(decidim_polis_manifest.js decidim/polis/action_plans.csv decidim/polis/meetings.csv decidim/polis/proposals.csv)
      end

      initializer "decidim_polis.public" do |app|
        app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
      end
    end
  end
end
