# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # Controller that allows managing Polis.
      #
      class PolisController < Decidim::Admin::ApplicationController

        layout "decidim/admin/polis"

        # without the app/models/decidim/polis/abilities
        # you can skip authorization with this :
        # skip_authorization_check :only => [:show]

        def index
          authorize! :polis, Decidim::Polis
        end

        def show
          authorize! :show, Decidim::Polis
        end

      end
    end
  end
end
