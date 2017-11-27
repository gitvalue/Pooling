# Pooling
Pooling is an interface for classes that implement [object pool design pattern](https://en.wikipedia.org/wiki/Object_pool_pattern)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

- iOS 8.0+
- Xcode 9.0+
- Swift 4

### Installing

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Pooling into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Pooling', '<release version>'
end
```

Then, run the following command:

```bash
$ pod install
```

#### Swift Package Manager

**Note:** At this time there is [no _official_ support for iOS targets or the related system libraries](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md#depending-on-apple-modules) in SPM. So read [this](https://github.com/j-channings/swift-package-manager-ios) before processing.

All you need is to define Pooling dependency in your package manifest file:

```Swift
import PackageDescription

let package = Package(
    name: "YourPackageName",
    products: [
        .library(name: "YourPackageName", targets: ["YourPackageName"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gitvalue/Pooling.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourPackageName",
            dependencies: ["Pooling"]),
        .testTarget(
            name: "YourPackageNameTests",
            dependencies: ["Pooling"]),
    ]
)
```

and then run

```bash
$ swift fetch
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SnapKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "https://github.com/gitvalue/Pooling" ~> 1.0.0
```

Run `carthage update` to build the framework and drag the built `Pooling.framework` into your Xcode project.

For more information read [this](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Pooling into your project manually by copying [Pooling.swift](/src/Pooling.swift), [Pool.swift](/src/Pool.swift) and [PThreadMutex.swift](/src/PThreadMutex.swift) source files to your project.

## Deployment

### Quick Start

```swift
import UIKit
import Pooling


class MyViewController: UIViewController {
    private var pool = Pool(size: 50, creator: { return UILabel(frame: CGRect.zero) })

    override func viewDidLoad() {
        super.viewDidLoad()

        // And now you ready to create your views
        let label = pool.borrow()
    }
}

```

## Notes

Pool uses a closure for creating objects, so in general case you should return object created with a designated initializer. It's specifically important when using subclasses:

```Swift
func createPool(forViewsOf type: UIView.Type) -> Pool<UIView> {
    return Pool<UIView>(size: 50) {
        return type.init(frame: CGRect.zero)
    }
}
``` 

## Versioning

This repo uses [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/gitvalue/Pooling/tags). 

## Authors

* **Dmitry Volosach** - *Initial work* - [@vlk1994](https://twitter.com/vlk1994)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [Matt Gallagher](https://github.com/mattgallagher) for his beautiful [CwlUtils](https://github.com/mattgallagher/CwlUtils)