require 'fastlane/action'
require_relative '../helper/rm_derived_data_helper'

module Fastlane
  module Actions
    class RmDerivedDataAction < Action
      def self.run(params)
        require 'json'
        require 'fileutils'

        system_derived_data  = params[:system_derived_data]
        xcodeproj            = params[:xcodeproj]
        workspace            = params[:workspace]
        scheme               = params[:scheme]
        module_cache_noindex = params[:module_cache_noindex]

        UI.success("system_derived_data: #{system_derived_data}")
        UI.success("xcodeproj: #{xcodeproj}")
        UI.success("workspace: #{workspace}")
        UI.success("scheme: #{scheme}")
        UI.success("module_cache_noindex: #{module_cache_noindex}")

        if system_derived_data
          derived_data_path = File.expand_path('Library/Developer/Xcode/DerivedData', ENV['HOME'])
          FileUtils.rm_rf(derived_data_path)
          UI.success("✅remove DerivedDataPath: #{derived_data_path}")
          return true
        end

        if !xcodeproj && !workspace
          UI.user_error!("❌ xcodeproj or workspace must give one")
        end
        UI.user_error!("❌no scheme given") unless scheme

        if xcodeproj
          # xcodebuild -showBuildSettings -project xx.xcodeproj -scheme xx -json
          str = Actions.sh("xcodebuild -showBuildSettings -project #{xcodeproj} -scheme #{scheme} -json")
        end

        if workspace
          # xcodebuild -showBuildSettings -workspace xx.xcworkspace -scheme xx -json
          str = Actions.sh("xcodebuild -showBuildSettings -workspace #{workspace} -scheme #{scheme} -json")
        end

        arr = JSON.parse(str)
        # UI.success(arr)
        if arr.empty?
          UI.user_error!("❌#{scheme} no buildSettings found")
          return false
        end

        build_settings = arr[0]['buildSettings']
        # UI.success(build_settings)

        ## DerivedData/DemoHaha-aojcutdqufwalmdppnjqhcygatiz
        build_root = build_settings['BUILD_ROOT']
        build_root = build_root.gsub('/Build/Products', '')
        UI.important("🔵remove DerivedData: #{build_root} ... ")
        FileUtils.rm_rf(build_root)
        UI.success("✅remove DerivedData success")

        ## DerivedData/ModuleCache.noindex
        if module_cache_noindex
          module_cache_noindex_dir = build_settings['MODULE_CACHE_DIR']
          UI.important("🔵remove ModuleCache.noindex: #{module_cache_noindex_dir} ...")
          FileUtils.rm_rf(module_cache_noindex_dir)
          UI.success("✅remove ModuleCache.noindex success")
        end

        return true
      end

      def self.description
        "after build finish remove xx.xcworkspace/xx.xcodeproj DerivedData"
      end

      def self.authors
        ["xiongzenghui"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "after build finish remove xx.xcworkspace/xx.xcodeproj specify DerivedDatagst/xx"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :system_derived_data,
            description: 'if true then remove ~/Library/Developer/Xcode/DerivedData',
            optional: true,
            is_string: false,
            default_value: true,
            conflicting_options: [:workspace, :xcodeproj]
          ),
          FastlaneCore::ConfigItem.new(
            key: :xcodeproj,
            description: '/path/to/xx.xcodeproj',
            optional: true,
            conflicting_options: [:workspace]
          ),
          FastlaneCore::ConfigItem.new(
            key: :workspace,
            description: '/path/to/xx.xcworkspace',
            optional: true,
            conflicting_options: [:xcodeproj]
          ),
          FastlaneCore::ConfigItem.new(
            key: :scheme,
            description: 'The project or workspace scheme',
            optional: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :module_cache_noindex,
            description: '~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex',
            optional: true,
            is_string: false,
            default_value: false
          )
        ]
      end

      def self.category
        :building
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
