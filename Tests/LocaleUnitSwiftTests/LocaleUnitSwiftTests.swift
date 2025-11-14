// LocaleUnitSwiftTests
// Developed by tearsinthegame

import XCTest
@testable import LocaleUnitSwift

final class LocaleUnitSwiftTests: XCTestCase {
    func testMeasurement() throws {
        let u = LocaleUnitSwift()
        let measure = Measurement(value: 5, unit: UnitLength.meters)
        let sym = u.convertedToLocalePreferred(measure, locale: Locale(identifier: "en-US"))
        print(sym)
    }
    
    func testSymbol() throws {
        let u = LocaleUnitSwift()
        //let unit = u.unit(for: UnitLength.self)
        let sym = u.symbol(for: UnitLength.self, locale: Locale(identifier: "en-US"))
        print(sym)
    }
}
