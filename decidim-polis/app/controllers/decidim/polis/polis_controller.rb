# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      def show
        filepath = '/home/mako/decidim-efb/.file.json'
        country = File.read(filepath)
        @tab_word = JSON.parse(country)

        @feature = Feature.find(params[:feature_id])
        settings = @feature.settings
        @title = settings.title.capitalize
        @description = settings.description.html_safe
        @ucw = !settings.user_can_write?
        @ucv = !settings.user_can_vote?
        @sign_in_social = !settings.sign_in_social?
        @show_vis = settings.visualization?
      end
    end
  end
end
