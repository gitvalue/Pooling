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

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Pooling into your project manually by copying [Pooling.swift](/src/Pooling.swift), [Poolable.swift](/src/Poolable.swift), [Pool.swift](/src/Pool.swift) and [PThreadMutex.swift](/src/PThreadMutex.swift) source files to your project.

## Deployment

### Quick Start

```swift
import UIKit
import Pooling

extension UIView: Poolable {
    static func create() -> UIView {
        return UIView()
    }
}

class MyViewController: UIViewController {
    private var pool = Pool<UIView>(size: 50)

    override func viewDidLoad() {
        super.viewDidLoad()

        let pooledView = pool.borrow()
        view.addSubview(pooledView)
    }
}
``` 

## Authors

* **Dmitry Volosach** - *Initial work* - [@vlk1994](https://twitter.com/vlk1994)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [Matt Gallagher](https://github.com/mattgallagher) for his beautiful [CwlUtils](https://github.com/mattgallagher/CwlUtils)