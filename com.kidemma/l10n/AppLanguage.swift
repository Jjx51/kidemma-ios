import Foundation
import SwiftUI

public enum AppLanguage: String, CaseIterable, Identifiable {
    case system
    case es
    case en

    public var id: String { rawValue }

    public var displayName: String {
        switch self {
        case .system: return L10n.string("language.system")
        case .es: return L10n.string("language.spanish")
        case .en: return L10n.string("language.english")
        }
    }

    public var locale: Locale? {
        switch self {
        case .system: return nil
        case .es: return Locale(identifier: "es")
        case .en: return Locale(identifier: "en")
        }
    }

    public var bundle: Bundle {
        guard self != .system,
              let path = Bundle.main.path(forResource: self.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return .main
        }
        return bundle
    }

    public var isRTL: Bool {
        ["ar", "he", "fa", "ur"].contains(self.rawValue)
    }
}
