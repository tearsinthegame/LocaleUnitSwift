import XCTest
@testable import LocaleUnitSwift

final class LocaleUnitSwiftTests: XCTestCase {
    func testExample() throws {
        let u = LocaleUnitSwift()
        let measure = Measurement(value: 5, unit: UnitLength.meters)
        let sym = u.convertedToLocalePreferred(measure, locale: Locale(identifier: "en-US"))
        print(sym)
    }
}
