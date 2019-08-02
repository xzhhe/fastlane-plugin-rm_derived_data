# rm_derived_data plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-rm_derived_data)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-rm_derived_data`, add it to your project by running:

```bash
fastlane add_plugin rm_derived_data
```

## About rm_derived_data

de

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```ruby
rm_derived_data(derived_data: '/Users/xiongzenghui/Library/Developer/Xcode/DerivedData/')
```

```ruby
rm_derived_data(module_cache_noindex: '/Users/xiongzenghui/Library/Developer/Xcode/DerivedData/ModuleCache.noindex')
```

```ruby
rm_derived_data(
  xcodeproj: '/Users/xiongzenghui/Desktop/DemoHaha/DemoHaha.xcodeproj',
  scheme: 'DemoHaha'
)
```

```ruby
rm_derived_data(
  xcodeproj: '/Users/xiongzenghui/Desktop/DemoHaha/DemoHaha.xcodeproj',
  scheme: 'DemoHaha',
  module_cache_noindex: '/Users/xiongzenghui/Library/Developer/Xcode/DerivedData/ModuleCache.noindex'
)
```

```ruby
rm_derived_data(
  workspace: '/Users/xiongzenghui/ios_projects/osee2unified/osee2unified/osee2unified.xcworkspace',
  scheme: 'osee2unifiedRelease',
  module_cache_noindex: '/Users/xiongzenghui/Library/Developer/Xcode/DerivedData/ModuleCache.noindex'
)
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
