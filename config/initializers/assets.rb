# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( normalize.css )
Rails.application.config.assets.precompile += %w( amazeui.min.css )
Rails.application.config.assets.precompile += %w( common.css )
Rails.application.config.assets.precompile += %w( admin.scss )
Rails.application.config.assets.precompile += %w( umeditor.css )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( amazeui.min.js )
Rails.application.config.assets.precompile += %w( template.min.js )
Rails.application.config.assets.precompile += %w( umeditor.config.js )
Rails.application.config.assets.precompile += %w( editor_api.js )