//
//  FontManager.swift
//  com.kidemma
//
//  Created on March 17, 2026.
//

import SwiftUI

/// Enum que contiene todas las fuentes personalizadas de la aplicación
enum CustomFont: String, CaseIterable {
    // MARK: - Poppins
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case regular = "Poppins-Regular"
    case italic = "Poppins-Italic"
    case medium = "Poppins-Medium"
    case mediumItalic = "Poppins-MediumItalic"
    case semiBold = "Poppins-SemiBold"
    case semiBoldItalic = "Poppins-SemiBoldItalic"
    case bold = "Poppins-Bold"
    case boldItalic = "Poppins-BoldItalic"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"

    // MARK: - Ginger Biscuit
    case gingerBiscuit = "Ginger Biscuit - Personal Use"

    /// Retorna una fuente SwiftUI con el tamaño especificado
    func of(size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }

    #if canImport(UIKit)
    /// Retorna una UIFont con el tamaño especificado (iOS/iPadOS)
    func uiFont(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    #elseif canImport(AppKit)
    /// Retorna una NSFont con el tamaño especificado (macOS)
    func nsFont(size: CGFloat) -> NSFont {
        return NSFont(name: self.rawValue, size: size) ?? NSFont.systemFont(ofSize: size)
    }
    #endif
}

/// Extensión de Font para acceso fácil a fuentes personalizadas
extension Font {
    // MARK: - Fuentes Predefinidas por Tamaño Semántico

    static func appLargeTitle(weight: CustomFont = .bold) -> Font {
        return weight.of(size: 34)
    }

    static func appTitle1(weight: CustomFont = .bold) -> Font {
        return weight.of(size: 28)
    }

    static func appTitle2(weight: CustomFont = .semiBold) -> Font {
        return weight.of(size: 22)
    }

    static func appTitle3(weight: CustomFont = .semiBold) -> Font {
        return weight.of(size: 20)
    }

    static func appHeadline(weight: CustomFont = .semiBold) -> Font {
        return weight.of(size: 17)
    }

    static func appBody(weight: CustomFont = .regular) -> Font {
        return weight.of(size: 17)
    }

    static func appSubheadline(weight: CustomFont = .regular) -> Font {
        return weight.of(size: 15)
    }

    static func appFootnote(weight: CustomFont = .regular) -> Font {
        return weight.of(size: 13)
    }

    static func appCaption(weight: CustomFont = .regular) -> Font {
        return weight.of(size: 12)
    }

    static func appCaption2(weight: CustomFont = .regular) -> Font {
        return weight.of(size: 11)
    }

    // MARK: - Método Genérico

    static func custom(_ font: CustomFont, size: CGFloat) -> Font {
        return font.of(size: size)
    }
}

// MARK: - Font Loader & Validator

/// Utilidad para cargar y validar fuentes
struct FontLoader {

    /// Imprime todas las fuentes disponibles en la app (útil para debugging)
    static func printAvailableFonts() {
        #if canImport(UIKit)
        print("Fuentes disponibles en la aplicación:")
        for family in UIFont.familyNames.sorted() {
            print("\n  Familia: \(family)")
            let names = UIFont.fontNames(forFamilyName: family)
            for name in names {
                print("    • \(name)")
            }
        }
        #endif
    }

    /// Verifica si todas las fuentes personalizadas están cargadas correctamente
    @discardableResult
    static func validateCustomFonts() -> Bool {
        var allFontsAvailable = true
        print("\nValidando fuentes personalizadas...")
        for customFont in CustomFont.allCases {
            let fontName = customFont.rawValue
            #if canImport(UIKit)
            if UIFont(name: fontName, size: 12) != nil {
                print("OK: \(fontName)")
            } else {
                print("FALTA: \(fontName)")
                allFontsAvailable = false
            }
            #endif
        }
        return allFontsAvailable
    }
}

// MARK: - Preview Helper

#if DEBUG
struct FontPreview: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Poppins Bold - Large Title").font(.appLargeTitle())
                Text("Poppins Bold - Title 1").font(.appTitle1())
                Text("Poppins SemiBold - Title 2").font(.appTitle2())
                Text("Poppins SemiBold - Headline").font(.appHeadline())
                Text("Poppins Regular - Body").font(.appBody())
                Text("Poppins Regular - Subheadline").font(.appSubheadline())
                Text("Poppins Regular - Caption").font(.appCaption())
                Divider()
                Text("Ginger Biscuit").font(.custom(.gingerBiscuit, size: 28))
            }
            .padding()
        }
        .onAppear {
            FontLoader.validateCustomFonts()
        }
    }
}

#Preview("Fuentes") {
    FontPreview()
}
#endif
