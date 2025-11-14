#  LocaleUnitSwift

[![Swift Package Manager compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
![Platforms](https://img.shields.io/badge/platforms-macOS%2013%2B%20%7C%20iOS%2016%2B%20%7C%20tvOS%2016%2B%20%7C%20macCatalyst%2016%2B%20%7C%20watchOS%209%2B-blue.svg)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

A helper library that manages Unit, Measurement and Dimension related functions in Swift, respecting the locale settings of the user or the locale selected by the developer.

The library can be helpful especially for automatic detection of the user-specific settings. The helper functions can be called simply by:
```swift
import LocaleUnitSwift

let localeUnit = LocaleUnitSwift()
let userArea = localeUnit.symbol(for: UnitLength.self) // returns the UnitLength for the user
let userAreaString = localeUnit.symbol(for: UnitArea.self, locale: Locale(identifier: "en-US")) // returns "ft²"
```

## Setup

You can add LocaleUnitSwift to your project with Swift Package Manager. In Xcode, select File > Add Package Dependency. Then, enter this Github repository URL: https://github.com/tearsinthegame/LocaleUnitSwift


## More About Usage

It is also possible to convert Measurement to the user's default locale value with correct units, with the option to select the Locale:
```swift
let localeUnit = LocaleUnitSwift()
let measure = Measurement(value: 5, unit: UnitLength.meters)
let converted = localeUnit.convertedToLocalePreferred(measure, locale: Locale(identifier: "en-US")) // returns converted Measurement, "16.404199475065617 ft"
```

## LICENSE

This library is licensed with Apache 2.0.


