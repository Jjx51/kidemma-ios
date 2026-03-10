import Foundation
import SwiftUI

public struct L10n {
    public static func key(
        _ name: String,
        table: String = "Localizable",
        bundle: Bundle = .main,
        defaultValue: String.LocalizationValue? = nil
    ) -> LocalizedStringResource {
        // Dynamic keys cannot use defaultValue with this initializer overload.
        return LocalizedStringResource(String.LocalizationValue(name), table: table, bundle: bundle)
    }

    public static func key(
        _ name: StaticString,
        table: String = "Localizable",
        bundle: Bundle = .main,
        defaultValue: String.LocalizationValue? = nil
    ) -> LocalizedStringResource {
        if let defaultValue {
            return LocalizedStringResource(name, defaultValue: defaultValue, table: table, bundle: bundle)
        }
        return LocalizedStringResource(
            String.LocalizationValue(String(describing: name)),
            table: table,
            bundle: bundle
        )
    }

    public static func string(_ name: String, table: String = "Localizable", bundle: Bundle = .main) -> String {
        String(localized: String.LocalizationValue(name), table: table, bundle: bundle)
    }
}
