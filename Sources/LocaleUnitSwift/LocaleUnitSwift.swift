// LocaleUnitSwift
// Developed by tearsinthegame

import Foundation

public class LocaleUnitSwift {
    
    /// Return the locale-preferred Unit for the given Dimension subclass type.
    /// If the platform doesn't offer `init(forLocale:)`, returns a sensible default unit.
    private func getUnit(for dimensionType: Dimension.Type,
                            locale: Locale = .current) -> Unit {
        
        // Acceleration
        if dimensionType == UnitAcceleration.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitAcceleration(forLocale: locale) }
        }
        
        // Angle
        if dimensionType == UnitAngle.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitAngle(forLocale: locale) }
        }
        
        // Area
        if dimensionType == UnitArea.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitArea(forLocale: locale) }
        }
        
        // Concentration (mass)
        if dimensionType == UnitConcentrationMass.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitConcentrationMass(forLocale: locale) }
        }
        
        // Dispersion (ppm, etc.)
        if dimensionType == UnitDispersion.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitDispersion(forLocale: locale) }
        }
        
        // Duration (time)
        if dimensionType == UnitDuration.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitDuration(forLocale: locale) }
        }
        
        // Electric charge
        if dimensionType == UnitElectricCharge.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitElectricCharge(forLocale: locale) }
        }
        
        // Electric current
        if dimensionType == UnitElectricCurrent.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitElectricCurrent(forLocale: locale) }
        }
        
        // Electric potential difference (voltage)
        if dimensionType == UnitElectricPotentialDifference.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitElectricPotentialDifference(forLocale: locale) }
        }
        
        // Electric resistance
        if dimensionType == UnitElectricResistance.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitElectricResistance(forLocale: locale) }
        }
        
        // Energy
        if dimensionType == UnitEnergy.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitEnergy(forLocale: locale) }
        }
        
        // Frequency
        if dimensionType == UnitFrequency.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitFrequency(forLocale: locale) }
        }
        
        // Fuel efficiency
        if dimensionType == UnitFuelEfficiency.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitFuelEfficiency(forLocale: locale) }
        }
        
        // Illuminance
        if dimensionType == UnitIlluminance.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitIlluminance(forLocale: locale) }
        }
        
        // Information storage
        if dimensionType == UnitInformationStorage.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitInformationStorage(forLocale: locale) }
        }
        
        // Length
        if dimensionType == UnitLength.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitLength(forLocale: locale) }
        }
        
        // Mass
        if dimensionType == UnitMass.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitMass(forLocale: locale) }
        }
        
        // Power
        if dimensionType == UnitPower.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitPower(forLocale: locale) }
        }
        
        // Pressure
        if dimensionType == UnitPressure.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitPressure(forLocale: locale) }
        }
        
        // Speed
        if dimensionType == UnitSpeed.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitSpeed(forLocale: locale) }
        }
        
        // Temperature
        if dimensionType == UnitTemperature.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitTemperature(forLocale: locale) }
        }
        
        // Volume
        if dimensionType == UnitVolume.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitVolume(forLocale: locale) }
        }
        
        return Unit(symbol: "")
    }
    
    /// Returns the user-specific Unit, if locale is not specified
    public func unit(for dimensionType: Dimension.Type, locale: Locale = .current) -> Unit {
        return getUnit(for: dimensionType, locale: locale)
    }
    
    /// Returns the user-specific Unit symbol as String, if locale is not specified
    public func symbol(for dimensionType: Dimension.Type, locale: Locale = .current) -> String {
        return getUnit(for: dimensionType, locale: locale).symbol
    }
    
    /// Convert a Measurement<U> to the locale-preferred Unit.
    /// If the conversion can't be determined, returns the original measurement.
    public func convertedToLocalePreferred<U: Dimension>(_ measurement: Measurement<U>, locale: Locale = .current) -> Measurement<U> {
        let targetUnit = getUnit(for: U.self as Dimension.Type, locale: locale)
        if let typed = targetUnit as? U {
            return measurement.converted(to: typed)
        } else {
            return measurement
        }
    }
}
