// LocaleUnitSwift
// Developed by tearsinthegame

import Foundation

public class LocaleUnitSwift {
    public init() {
        
    }
    
    /// Return the locale-preferred Unit for the given Dimension subclass type.
    /// If the platform doesn't offer `init(forLocale:)`, returns a sensible default unit.
    private func getUnit<U: Dimension>(for dimensionType: Dimension.Type, locale: Locale = .current, usage: MeasurementFormatUnitUsage<U>? = nil) -> Unit {
        
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
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    return UnitEnergy(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitEnergy>)
                }
                return UnitEnergy(forLocale: locale)
            }
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
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    return UnitLength(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitLength>)
                }
                return UnitLength(forLocale: locale)
            }
        }
        
        // Mass
        if dimensionType == UnitMass.self {
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    return UnitMass(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitMass>)
                }
                return UnitMass(forLocale: locale)
            }
        }
        
        // Power
        if dimensionType == UnitPower.self {
            if #available(iOS 16.0, macOS 13.0, *) { return UnitPower(forLocale: locale) }
        }
        
        // Pressure
        if dimensionType == UnitPressure.self {
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    if #available(macOS 14, *) {
                        return UnitPressure(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitPressure>)
                    }
                }
                return UnitPressure(forLocale: locale)
            }
        }
        
        // Speed
        if dimensionType == UnitSpeed.self {
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    if #available(macOS 14, *) {
                        return UnitSpeed(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitSpeed>)
                    }
                }
                return UnitSpeed(forLocale: locale)
            }
        }
        
        // Temperature
        if dimensionType == UnitTemperature.self {
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    return UnitTemperature(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitTemperature>)
                }
                return UnitTemperature(forLocale: locale)
            }
        }
        
        // Volume
        if dimensionType == UnitVolume.self {
            if #available(iOS 16.0, macOS 13.0, *) {
                if usage != nil {
                    return UnitVolume(forLocale: locale, usage: usage! as! MeasurementFormatUnitUsage<UnitVolume>)
                }
                return UnitVolume(forLocale: locale)
            }
        }
        
        // Custom Units
        if let customType = dimensionType as? LocaleUnitSwiftCustom.Type {
            return customType.unit(for: locale)
        }
        
        return Unit(symbol: "")
    }
    
    /// Returns the user-specific Unit, if locale is not specified
    /// Usage might not be available for every predefined Unit, check the Apple documentation for MeasurementFormatUnitUsage
    public func unit<U: Dimension>(for dimensionType: U.Type, locale: Locale = .current, usage: MeasurementFormatUnitUsage<U>? = nil) -> Unit {
        if usage != nil {
            return getUnit(for: dimensionType, locale: locale, usage: usage!)
        }
        return getUnit(for: dimensionType, locale: locale)
    }
    
    /// Returns the user-specific Unit symbol as String, if locale is not specified
    /// Usage might not be available for every predefined Unit, check the Apple documentation for MeasurementFormatUnitUsage
    public func symbol<U: Dimension>(for dimensionType: U.Type, locale: Locale = .current, usage: MeasurementFormatUnitUsage<U>? = nil) -> String {
        if usage != nil {
            return getUnit(for: U.self as Dimension.Type, locale: locale, usage: usage!).symbol
        }
        return getUnit(for: U.self as Dimension.Type, locale: locale).symbol
    }
    
    /// Convert a Measurement<U> to the locale-preferred Unit.
    /// If the conversion can't be determined, returns the original measurement.
    /// Usage might not be available for every predefined Unit, check the Apple documentation for MeasurementFormatUnitUsage
    public func convertedToLocaleValue<U: Dimension>(_ measurement: Measurement<U>, locale: Locale = .current, usage: MeasurementFormatUnitUsage<U>? = nil) -> Measurement<U> {
        let targetUnit = usage == nil ? getUnit(for: U.self as Dimension.Type, locale: locale) : getUnit(for: U.self as Dimension.Type, locale: locale, usage: usage!)
        if let typed = targetUnit as? U {
            return measurement.converted(to: typed)
        } else {
            return measurement
        }
    }
}

public protocol LocaleUnitSwiftCustom: Dimension {
    /// Return the appropriate unit for the given locale.
    static func unit(for locale: Locale) -> Unit
}
