# frozen_string_literal: true

module Decidim
  module Polis
    module Abilities
      module Admin
        # Defines the abilities for an admin user. Intended to be used with `cancancan`.
        class AdminAbility < Decidim::Abilities::AdminAbility
          def define_abilities
            super

            can :manage, Polis
          end
        end
      end
    end
  end
end
