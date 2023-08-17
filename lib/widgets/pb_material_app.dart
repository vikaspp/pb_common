import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PBMaterialApp extends StatelessWidget {
  final String title;

  final bool debugShowCheckedModeBanner;
  final bool checkerboardOffscreenLayers;
  final bool checkerboardRasterCacheImages;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool showSemanticsDebugger;

  final ThemeData? theme;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;

  final Color? color;

  final Map<String, Widget Function(BuildContext)> routes;
  final Widget Function(BuildContext, Widget?)? builder;
  final Map<Type, Action<Intent>>? actions;

  final Widget? home;

  final String? initialRoute;
  final String? restorationScopeId;

  final Locale? locale;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  final List<NavigatorObserver> navigatorObservers;
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final String Function(BuildContext)? onGenerateTitle;
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;

  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final ScrollBehavior? scrollBehavior;
  final Map<ShortcutActivator, Intent>? shortcuts;

  final Curve themeAnimationCurve;

  final Duration themeAnimationDuration;

  const PBMaterialApp({
    super.key,
    required this.title,
    this.debugShowCheckedModeBanner = false,
    this.theme,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.darkTheme,
    this.themeMode,
    this.routes = const <String, WidgetBuilder>{},
    this.color,
    this.builder,
    this.actions,
    this.checkerboardOffscreenLayers = false,
    this.checkerboardRasterCacheImages = false,
    this.debugShowMaterialGrid = false,
    this.home,
    this.initialRoute,
    this.localeResolutionCallback,
    this.localeListResolutionCallback,
    this.localizationsDelegates,
    this.onGenerateTitle,
    this.onGenerateRoute,
    this.locale,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.restorationScopeId,
    this.scaffoldMessengerKey,
    this.scrollBehavior,
    this.shortcuts,
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.themeAnimationCurve = Curves.linear,
    this.themeAnimationDuration = kThemeAnimationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: title,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      color: color,
      routes: routes,
      builder: builder,
      actions: actions,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      debugShowMaterialGrid: debugShowMaterialGrid,
      highContrastDarkTheme: highContrastDarkTheme,
      highContrastTheme: highContrastTheme,
      home: home,
      initialRoute: initialRoute,
      locale: locale,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      navigatorObservers: navigatorObservers,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: onGenerateTitle,
      onUnknownRoute: onUnknownRoute,
      restorationScopeId: restorationScopeId,
      scaffoldMessengerKey: scaffoldMessengerKey,
      scrollBehavior: scrollBehavior,
      shortcuts: shortcuts,
      showPerformanceOverlay: showPerformanceOverlay,
      showSemanticsDebugger: showSemanticsDebugger,
      supportedLocales: supportedLocales,
      themeAnimationCurve: themeAnimationCurve,
      themeAnimationDuration: themeAnimationDuration,
    );
  }
}
