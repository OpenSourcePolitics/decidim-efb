# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      helper Decidim::ApplicationHelper

      helper_method :available_polis

      def index
        redirect_to action: :show, id: available_polis.first
      end

      def show
        @id = params[:id]
        raise ActiveRecord::RecordNotFound unless available_polis.include?(@id)
      end

      private

      def available_polis
        %w(summary total_interactions proposals action_plans meetings map open_data)
      end
    end
  end
end
