# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      def show
        @feature = Feature.find(params[:feature_id])
        settings = @feature.settings
        @title = settings.title.capitalize
        @description = settings.description.html_safe
        @ucw = !settings.user_can_write?
        @ucv = !settings.user_can_vote?
        @sign_in_social = !settings.sign_in_social?
        @show_vis = settings.visualization?
        @moderator = moderator?
        @admin = admin?
      end

      private

      def admin?
        current_user && current_user.admin?
      end

      def moderator?
        current_user && current_user.roles.include?("user_manager")
      end
    end
  end
end
