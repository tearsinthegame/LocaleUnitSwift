// LocaleUnitSwiftTests
// Developed by tearsinthegame

import XCTest
@testable import LocaleUnitSwift

final class LocaleUnitSwiftTests: XCTestCase {
    func testMeasurement() throws {
        let u = LocaleUnitSwift()
        let measure = Measurement(value: 5, unit: UnitLength.meters)
        let sym = u.convertedToLocaleValue(measure, locale: Locale(identifier: "en-US"))
        print(sym)
    }
    
    func testSymbol() throws {
        let u = LocaleUnitSwift()
        //let unit = u.unit(for: UnitLength.self)
        let sym = u.symbol(for: UnitLength.self, locale: Locale(identifier: "en-US"))
        print(sym)
    }
    
    func testCustom() throws {
        let u = LocaleUnitSwift()
        let sym = u.symbol(for: UnitCustom.self)
        print(sym)
    }
}

final class UnitCustom: Dimension {
    
    static let unitA = UnitCustom(symbol: "A", converter: UnitConverterLinear(coefficient: 1.0))
    static let unitB = UnitCustom(symbol: "B", converter: UnitConverterLinear(coefficient: 1.5))
    
    override class func baseUnit() -> UnitCustom {
        UnitCustom.unitA
    }
}

extension UnitCustom: LocaleUnitSwiftCustom {
    static func unit(for locale: Locale) -> Unit {
        
        if locale.measurementSystem == .metric {
            return Self.unitA
        } else {
            return Self.unitB
        }
        
    }
}
