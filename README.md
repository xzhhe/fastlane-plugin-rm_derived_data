# rm_derived_data plugin

## xcode derived data

### 只要打开一个 xcode 项目, 就会自动在 `~/Library/Developer/Xcode/DerivedData` 生成 `对应` 编译产物输出目录

```
╭─xiongzenghui at xiongzenghui的MacBook Pro in ~/Library/Developer/Xcode/DerivedData using ‹ruby-2.4.1›
╰─○ ll
total 0
drwxr-xr-x@  6 xiongzenghui  staff   192B  9 23 16:07 LLVM-apurppmdjckueedqqfzdrbyyltzm
drwxr-xr-x@ 34 xiongzenghui  staff   1.1K  9 23 16:07 ModuleCache.noindex
drwxr-xr-x@  9 xiongzenghui  staff   288B  9 23 15:56 XZHApp-cqppbevzvkwcelefwfeqzqctokge
drwxr-xr-x@  8 xiongzenghui  staff   256B  9 23 16:07 ZHUDID-czwuhrgquyarnyfjflrnacetnhjk
```

注意: 只要 **打开** xcode 项目, 就会产生, 并 **不是** 触发构建 的时候才会产生.

### ModuleCache.noindex

```
╰─○ tree ModuleCache.noindex
ModuleCache.noindex
├── 12SQKYL6LHBKH
│   ├── CFNetwork-VYJNNHSS8W4D.pcm
│   ├── CoreFoundation-SDWOWORXRBJW.pcm
│   ├── CoreGraphics-10LIZC6Y65ZED.pcm
│   ├── CoreImage-1B6FSCPAMYG7R.pcm
............................................
├── 1BUC5269Y62FR
│   ├── AdSupport-365IWPK3PFAFF.pcm
│   ├── AdSupport-365IWPK3PFAFF.pcm.timestamp
│   ├── CFNetwork-VYJNNHSS8W4D.pcm
............................................
18N4HES0MC.pcm.lock-0cccd1dd
│   ├── SystemServices-3SIZSWKQ2N8JL.pcm
│   ├── SystemServices-3SIZSWKQ2N8JL.pcm.timestamp
│   ├── UIKit-1MCEWB5GAZIR1.pcm
............................................
├── Combine-36Z57D3UJ77Z4.swiftmodule
├── CoreFoundation-1D0T08KYD3F71.swiftmodule
├── CoreGraphics-2LBYYRO7K95EK.swiftmodule
├── CoreImage-8ZNHKN5SKJV.swiftmodule
├── Darwin-23XRNHHMIUAR6.swiftmodule
├── Dispatch-3B0YKNY14T4UX.swiftmodule
├── Foundation-22VCETPMWJ1G3.swiftmodule
├── Metal-QILX60KZ7GU.swiftmodule
├── ObjectiveC-30RESJKTNIXV0.swiftmodule
├── QuartzCore-2P85X64GAAFVV.swiftmodule
├── Session.modulevalidation
├── Swift-1R1CSYSUGIFA6.swiftmodule
├── SwiftOnoneSupport-38VL9XG4HM5R6.swiftmodule
├── UIKit-1IKM0IQL599QV.swiftmodule
├── VLR4RW1AGKFC
│   ├── CFNetwork-VYJNNHSS8W4D.pcm
│   ├── CoreFoundation-SDWOWORXRBJW.pcm
│   ├── Darwin-1LVP8K6HYW6R.pcm
│   ├── Dispatch-2ACIYJQCJ23SG.pcm
│   ├── Foundation-K7W1BMS6PHG4.pcm
│   ├── ObjectiveC-1RC2QFMVNKOWP.pcm
│   ├── Security-3TC6DA67EE6LA.pcm
│   ├── _Builtin_stddef_max_align_t-3XGGJNKRO7QV.pcm
│   ├── modules.idx
│   └── os_object-1LVP8K6HYW6R.pcm
├── XCTest-1U62TC4BRL1PF.swiftmodule
└── modules.timestamp
```

都是一些 **pcm** 文件 和 **swiftmodule** 文件.

### 每一个 xcode 项目, 都唯一对应一个 `scheme-hash` 目录

```
LLVM-apurppmdjckueedqqfzdrbyyltzm
ModuleCache.noindex
XZHApp-cqppbevzvkwcelefwfeqzqctokge
ZHUDID-czwuhrgquyarnyfjflrnacetnhjk
```

### 其中某个 XZHApp-cqppbevzvkwcelefwfeqzqctokge 目录

```
╭─xiongzenghui at xiongzenghui的MacBook Pro in ~/Library/Developer/Xcode/DerivedData/XZHApp-cqppbevzvkwcelefwfeqzqctokge using ‹ruby-2.4.1›
╰─○ ll
total 16
drwxr-xr-x  4 xiongzenghui  staff   128B  9 23 15:53 Build
drwxr-x---  5 xiongzenghui  staff   160B  9 23 15:52 Index
drwxr-xr-x  9 xiongzenghui  staff   288B  9 23 15:52 Logs
drwxr-xr-x  2 xiongzenghui  staff    64B  9 23 15:52 SourcePackages
drwxr-xr-x  3 xiongzenghui  staff    96B  9 23 15:56 TextIndex
-rw-r--r--  1 xiongzenghui  staff   350B  9 23 15:52 info.plist
-rw-r--r--  1 xiongzenghui  staff   230B  9 23 15:52 scm.plist
```

这个目录下的文件, 就全部是当前这个 xcode 项目的所有中间编译产物了.

### XZHApp-cqppbevzvkwcelefwfeqzqctokge/info.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>LastAccessedDate</key>
	<date>2019-09-23T07:52:59Z</date>
	<key>WorkspacePath</key>
	<string>/Users/xiongzenghui/Desktop/XZHApp/XZHApp.xcworkspace</string>
</dict>
</plist>
```

### 



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
rm_derived_data(derived_data: '/Users/xiongzenghui/Library/Developer/Xcode/DerivedData')

rm_derived_data(
  xcodeproj: '/Users/xiongzenghui/Desktop/DemoHaha/DemoHaha.xcodeproj',
  scheme: 'DemoHaha'
)

rm_derived_data(
  xcodeproj: '/Users/xiongzenghui/Desktop/DemoHaha/DemoHaha.xcodeproj',
  scheme: 'DemoHaha',
  module_cache_noindex: true
)

rm_derived_data(
  workspace: '/Users/xiongzenghui/ios_projects/osee2unified/osee2unified/osee2unified.xcworkspace',
  scheme: 'osee2unifiedRelease'
)

rm_derived_data(
  workspace: '/Users/xiongzenghui/ios_projects/osee2unified/osee2unified/osee2unified.xcworkspace',
  scheme: 'osee2unifiedRelease',
  module_cache_noindex: true
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
