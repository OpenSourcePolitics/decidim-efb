# frozen_string_literal: true

module Decidim
  module Polis
    module Abilities
      # Defines the base abilities related to Polis for any user. Guest users
      # will use these too. Intended to be used with `cancancan`.
      class EveryoneAbility < Decidim::Abilities::EveryoneAbility
        def initialize(user, context)
          super(user, context)

          can :read, Polis, &:published?
        end
      end
    end
  end
end
