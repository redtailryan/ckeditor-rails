require 'ckeditor-rails/version'

module Ckeditor
  module Rails

    mattr_accessor :assets_languages
    @@assets_languages = nil

    mattr_accessor :assets_plugins
    @@assets_plugins = nil

    mattr_accessor :assets_skins
    @@assets_skins = nil

    class << self
      def configure
        yield self
      end

      def root_path
        @root_path ||= Pathname.new(File.expand_path('..', __FILE__))
      end

      def default_plugins
        %W[
          clipboard
          justify
          dialog
          iframe
          image
          link
          pastefromword
          specialchar
          tab
          table
        ]
      end

      def default_skins
        %w[minimalist]
      end
    end

  end
end

require 'ckeditor-rails/asset'

case ::Rails.version.to_s
when /^[45]/
  require 'ckeditor-rails/engine'
when /^3\.[12]/
  require 'ckeditor-rails/engine3'
when /^3\.[0]/
  require 'ckeditor-rails/railtie'
end if defined? ::Rails
