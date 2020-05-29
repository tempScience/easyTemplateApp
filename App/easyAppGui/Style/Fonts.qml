pragma Singleton

import QtQuick 2.15

QtObject {

    // Load fonts
    property FontLoader ptSansRegular: FontLoader { source: fontPath("PT_Sans", "PTSans-Regular") }
    property FontLoader ptSansBold: FontLoader { source: fontPath("PT_Sans", "PTSans-Bold") } // font.bold: true

    property FontLoader ptMono: FontLoader { source: fontPath("PT_Mono", "PTMono-Regular") }

    property FontLoader encodeSansRegular: FontLoader { source: fontPath("Encode_Sans", "EncodeSans-Regular") }
    property FontLoader encodeSansLight: FontLoader { source: fontPath("Encode_Sans", "EncodeSans-Light") } // font.weight: Font.Light

    property FontLoader encodeSansCondensedRegular: FontLoader { source: fontPath("Encode_Sans_Condensed", "EncodeSansCondensed-Regular") }
    property FontLoader encodeSansCondensedExtraLight: FontLoader { source: fontPath("Encode_Sans_Condensed", "EncodeSansCondensed-ExtraLight") } // font.weight: Font.ExtraLight

    property FontLoader encodeSansExpandedRegular: FontLoader { source: fontPath("Encode_Sans_Expanded", "EncodeSansExpanded-Regular") }
    property FontLoader encodeSansExpandedLight: FontLoader { source: fontPath("Encode_Sans_Expanded", "EncodeSansExpanded-Light") } // font.weight: Font.Light

    // Font families
    readonly property string fontFamily: ptSansRegular.name

    readonly property string monoFontFamily: ptMono.name

    readonly property string secondFontFamily: encodeSansRegular.name
    readonly property string secondCondensedFontFamily: encodeSansCondensedRegular.name
    readonly property string secondExpandedFontFamily: encodeSansExpandedRegular.name

    // Font sizes
    property Text _text: Text { font.pixelSize: 14 }

    readonly property int fontPointSize: _text.font.pointSize
    readonly property int fontPixelSize: _text.font.pixelSize

    // Logic
    function fontPath(fontDirName, fontFileName) {
        const fontsDirPath = Qt.resolvedUrl("../Resources/Fonts")
        return fontsDirPath + "/" + fontDirName + "/" + fontFileName + ".ttf"
    }

}
