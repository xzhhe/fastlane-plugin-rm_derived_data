require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class RmDerivedDataHelper
      # class methods that you define here become available in your action
      # as `Helper::RmDerivedDataHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the rm_derived_data plugin helper!")
      end
    end
  end
end
