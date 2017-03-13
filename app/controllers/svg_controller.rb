class SvgController < ApplicationController

  before_action :set_content_security_policy

  def example
    svg_data = File.read("app/assets/images/apple_logo.svg")
    send_data(svg_data, type: "image/svg+xml", disposition: :inline)
  end

  private

  def set_content_security_policy
    # This is a ridiculously permissive CSP, but because it doesn't explicitly
    # allow inline scripts, it keeps them from running.
    response.headers['Content-Security-Policy'] = "default-src *;"
  end
end
