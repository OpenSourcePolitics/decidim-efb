# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      def show
        @feature = Feature.find(params[:feature_id])
        @process = params[:participatory_process_slug]
        settings = @feature.settings
        step_settings = @feature.step_settings
        # @title = settings.title.capitalize.locale
        translated(settings.title, locale)
        @description = settings.description.html_safe
        @sign_in_social = settings.sign_in_social?
        @show_vis = !settings.visualization?
        @ucw = current_settings.user_can_write?
        @ucv = current_settings.user_can_vote?
        @moderator = moderator?
        @admin = admin?
        @langue = langue?
      end

      private

      def admin?
        current_user && current_user.admin?
      end

      def moderator?
        current_user && current_user.roles.include?("user_manager")
      end

      def langue?
        locale
      end
    end
  end
end
