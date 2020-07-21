class ApplicationController < ActionController::Base
  before_action :check_user_agent_for_mobile

  private

  def check_user_agent_for_mobile
    if request.from_smartphone?
      request.variant = :mobile
    end
  end
end
