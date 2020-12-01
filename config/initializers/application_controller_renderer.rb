# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
Rails.application.config.markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
