class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: {}

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
