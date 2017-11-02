# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      def show
        @feature = Feature.find(params[:feature_id])
        @ucw = @feature.settings.user_can_write?
        @ucv = @feature.settings.user_can_vote?
        @show_vis = @feature.settings.visualization?
      end
    end
  end
end
