# frozen_string_literal: true

module Terradactyl
  module Terraform
    module VersionManager
      module Package
        def architecture
          case value = RbConfig::CONFIG['host_cpu'].downcase
          when /amd64|x86_64/
            'amd64'
          when /i?86|x86|i86pc/
            '386'
          when /^arm$/
            'arm'
          when /^arm64/
            'arm64'
          else
            raise "FATAL: Unsupported CPU arch, #{value}"
          end
        end

        def platform
          case value = RbConfig::CONFIG['host_os'].downcase
          when /darwin/
            'darwin'
          when /freebsd/
            'freebsd'
          when /linux/
            'linux'
          when /openbsd/
            'openbsd'
          when /sunos|solaris/
            'solaris'
          when /mingw|mswin/
            'windows'
          else
            raise "FATAL: Unsupported OS Platform, #{value}"
          end
        end

        def releases_url
          VersionManager.releases_url
        end
      end
    end
  end
end
