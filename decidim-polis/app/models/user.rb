  class Decidim::User < ApplicationRecord
    def moderator?
      roles.include?("user_manager")
    end
  end
