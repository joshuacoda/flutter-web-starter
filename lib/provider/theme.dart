import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// https://github.com/iot-lab-kiit/Theme-Changer-Provider/blob/master/lib/provider/theme.dart

//  https://gist.github.com/ggichure/c1ca99f13a7e0f3e6842bedcab9970ba <---

class ThemeProvider extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;

  late ThemeMode _selectedThemeMode;
  late Color _selectedPrimaryColor;

  final String themeKey = "theme";
  final String primaryColorKey = "primary.color";

  ThemeMode get selectedThemeMode => _selectedThemeMode;
  Color get selectedPrimaryColor => _selectedPrimaryColor;

  ThemeProvider() {
    _selectedThemeMode = appThemes[0].mode;
    _selectedPrimaryColor = AppColors.primaryColors[0];
    loadFromPreferences();
  }
  setSelectedThemeMode(ThemeMode _themeMode) {
    _selectedThemeMode = _themeMode;
    saveThemePreferences(selectedThemeMode.name);
    notifyListeners();
  }

  setSelectedPrimaryColor(Color _color) {
    _selectedPrimaryColor = _color;
    savePrimaryColorPreferences(selectedPrimaryColor.value.toRadixString(16));
    notifyListeners();
  }

  _initPreferences() async {
    prefs = await _prefs;
  }

  mapTheme() {
    switch (prefs.getString(themeKey)) {
      case 'light':
        _selectedThemeMode = ThemeMode.light;
        break;
      case 'dark':
        _selectedThemeMode = ThemeMode.dark;
        break;
      case 'system':
        _selectedThemeMode = ThemeMode.system;
        break;
      default:
        _selectedThemeMode = ThemeMode.light;
    }
  }

  mapPrimaryColor() {
    switch (prefs.getString(primaryColorKey)) {
      case 'ffd23156':
        _selectedPrimaryColor = const Color(0xffd23156);
        break;
      case 'ff16b9fd':
        _selectedPrimaryColor = const Color(0xff16b9fd);
        break;
      case 'ff13d0c1':
        _selectedPrimaryColor = const Color(0xff13d0c1);
        break;
      case 'ffe5672f':
        _selectedPrimaryColor = const Color(0xffe5672f);
        break;
      case 'ffb73d99':
        _selectedPrimaryColor = const Color(0xffb73d99);
        break;
      default:
        _selectedPrimaryColor = const Color(0xffd23156);
    }
  }

  loadFromPreferences() async {
    await _initPreferences();
    mapTheme();
    mapPrimaryColor();
    notifyListeners();
  }

  saveThemePreferences(selectedThemeMode) async {
    await _initPreferences();
    prefs.setString(themeKey, selectedThemeMode);
  }

  savePrimaryColorPreferences(selectedPrimaryColor) async {
    await _initPreferences();
    prefs.setString(primaryColorKey, selectedPrimaryColor);
  }
}

class AppColors {
  static List<Color> primaryColors = const [
    Color(0xffd23156),
    Color(0xff16b9fd),
    Color(0xff13d0c1),
    Color(0xffe5672f),
    Color(0xffb73d99),
  ];

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }
}

class AppTheme {
  ThemeMode mode;
  String title;
  IconData icon;

  AppTheme({
    required this.mode,
    required this.title,
    required this.icon,
  });
}

List<AppTheme> appThemes = [
  AppTheme(
    mode: ThemeMode.light,
    title: 'Light',
    icon: Icons.brightness_5_rounded,
  ),
  AppTheme(
    mode: ThemeMode.dark,
    title: 'Dark',
    icon: Icons.brightness_2_rounded,
  ),
  AppTheme(
    mode: ThemeMode.system,
    title: 'Auto',
    icon: Icons.brightness_4_rounded,
  ),
];
