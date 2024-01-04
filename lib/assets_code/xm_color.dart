import 'dart:ui';

class XMColor extends Color {

  const XMColor(int hexValue, {double? opacity}) : 
    super(((((opacity ?? 1.0) * 0xff ~/ 1) & 0xff) << 24) | hexValue);

  static Color get xmMain => const XMColor(0x141927);
  static Color get xmBlue => const XMColor(0x4870FF);
  static Color get xmOrange => const XMColor(0xFF9C41);
  static Color get xmGreen => const XMColor(0x00D971);
  static Color get xmWhite => const XMColor(0xFFFFFF, opacity: 0.7);

  static Color get xmSeparator => const XMColor(0x21283F);

  static Color get xmGrey => const XMColor(0xEBEBF5, opacity: 0.6);
}