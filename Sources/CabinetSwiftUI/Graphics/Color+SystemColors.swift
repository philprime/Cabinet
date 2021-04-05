import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Extension for SwiftUI color to wrap common AppKit and UIKit colors
@available(iOS 13.0, OSX 10.15, *)
extension Color {

    public static var label: Color {
        #if canImport(UIKit)
        return Color(UIColor.label)
        #elseif canImport(AppKit)
        return Color(NSColor.labelColor)
        #endif
    }

    public static var secondaryLabel: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.secondaryLabelColor)
        #endif
    }

    public static var tertiaryLabel: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.tertiaryLabelColor)
        #endif
    }

    public static var quaternaryLabel: Color {
        #if canImport(UIKit)
        return Color(UIColor.quaternaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.quaternaryLabelColor)
        #endif
    }

    public static var systemFill: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemFill)
        #elseif canImport(AppKit)
        return Color(NSColor.systemRed)
        #endif
    }

    public static var secondarySystemFill: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondarySystemFill)
        #elseif canImport(AppKit)
        return Color(NSColor.systemRed)
        #endif
    }

    public static var tertiarySystemFill: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiarySystemFill)
        #elseif canImport(AppKit)
        return Color(NSColor.systemRed)
        #endif
    }

    public static var quaternarySystemFill: Color {
        #if canImport(UIKit)
        return Color(UIColor.quaternarySystemFill)
        #elseif canImport(AppKit)
        return Color(NSColor.quaternaryLabelColor)
        #endif
    }

    public static var systemBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var secondarySystemBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var tertiarySystemBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var systemGroupedBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGroupedBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var secondarySystemGroupedBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondarySystemGroupedBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var tertiarySystemGroupedBackground: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiarySystemGroupedBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #endif
    }

    public static var systemRed: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemRed)
        #elseif canImport(AppKit)
        return Color(NSColor.systemRed)
        #endif
    }

    public static var systemBlue: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemBlue)
        #elseif canImport(AppKit)
        return Color(NSColor.systemBlue)
        #endif
    }

    public static var systemPink: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemPink)
        #elseif canImport(AppKit)
        return Color(NSColor.systemPink)
        #endif
    }

    public static var systemTeal: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemTeal)
        #elseif canImport(AppKit)
        return Color(NSColor.systemTeal)
        #endif
    }

    public static var systemGreen: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGreen)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGreen)
        #endif
    }

    public static var systemIndigo: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemIndigo)
        #elseif canImport(AppKit)
        return Color(NSColor.systemIndigo)
        #endif
    }

    public static var systemOrange: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemOrange)
        #elseif canImport(AppKit)
        return Color(NSColor.systemOrange)
        #endif
    }

    public static var systemPurple: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemPurple)
        #elseif canImport(AppKit)
        return Color(NSColor.systemPurple)
        #endif
    }

    public static var systemYellow: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemYellow)
        #elseif canImport(AppKit)
        return Color(NSColor.systemYellow)
        #endif
    }

    public static var systemGray: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }

    public static var systemGray2: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray2)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }

    public static var systemGray3: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray3)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }

    public static var systemGray4: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray4)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }

    public static var systemGray5: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray5)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }

    public static var systemGray6: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemGray6)
        #elseif canImport(AppKit)
        return Color(NSColor.systemGray)
        #endif
    }
}
