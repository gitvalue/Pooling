# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Tests
- macOS version
- even more improved README

## [1.0.0] - 2017-11-27
### Changed
- Pod version
- Refined README


## [0.0.7] - 2017-11-27
### Added
- Carthage support

### Changed
- Pod version

### Fixed
- Corrected source files path in Podspec file


## [0.0.6] - 2017-11-27
### Changed
- Pod version


## [0.0.5] - 2017-11-24
### Added
- Swift Package Manager support

### Changed
- Refined README


## [0.0.4] - 2017-11-23
### Changed
- Refined README
- Now `Pooling` class accepts creator closure as a second `init` argument, instead of type.

### Removed
- `Poolable` interface no more needed.


## [0.0.3] - 2017-11-23
### Changed
- refined README
- added some trivial usage example in 'demo'
- `Poolable` interface: now `Poolable` objects have to implement default `init` to be poolable
- `Pooling` interface: now creator class `type` comes as second argument
- `Pool` implements requirements above


## [0.0.2] - 2017-11-22
### Added
- Xcode project with 'src' and 'demo' directories
- Podspec file
- .swift-version file
- `Pooling`, `Poolable`, `Pool` and `PThreadMutex` classes added


## 0.0.1 - 2017-11-22
### Added
- created repository
- .gitignore file
- README
- LICENCE

[0.0.2]: https://github.com/gitvalue/Pooling/compare/0.0.1...0.0.2
[0.0.3]: https://github.com/gitvalue/Pooling/compare/0.0.2...0.0.3
[0.0.4]: https://github.com/gitvalue/Pooling/compare/0.0.3...0.0.4
[0.0.5]: https://github.com/gitvalue/Pooling/compare/0.0.4...0.0.5
[0.0.6]: https://github.com/gitvalue/Pooling/compare/0.0.5...0.0.6
[0.0.7]: https://github.com/gitvalue/Pooling/compare/0.0.6...0.0.7
[1.0.0]: https://github.com/gitvalue/Pooling/compare/0.0.7...1.0.0
[Unreleased]: https://github.com/gitvalue/Pooling/compare/1.0.0...HEAD