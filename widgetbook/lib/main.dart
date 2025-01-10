import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  // ignore: missing_provider_scope
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    child: const App(),
  ));
}

class AccessibilityAddon extends BuilderAddon {
  AccessibilityAddon()
      : super(
          name: 'Accessibility',
          builder: (context, child) => AccessibilityTools(
            child: child,
          ),
        );
}

@widgetbook.App()
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.byDefault();

    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              // data: ThemeData.light(),
              data: theme.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              // data: ThemeData.light(),
              data: theme.darkTheme,
            ),
          ],
        ),
        GridAddon(100),
        AlignmentAddon(),
        AccessibilityAddon(),
        ZoomAddon(),
        // LocalizationAddon(
        //   locales: [
        //     const Locale('en', 'US'),
        //   ],
        //   localizationsDelegates: [
        //     DefaultWidgetsLocalizations.delegate,
        //     DefaultMaterialLocalizations.delegate,
        //   ],
        // ),
        // TextScaleAddon(
        //   scales: [1.0, 2.0],
        // ),
        // DeviceFrameAddon(
        //   devices: Devices.all,
        //   initialDevice: Devices.ios.iPhone13ProMax,
        // ),
        // InspectorAddon(enabled: true),
        // BuilderAddon(
        //   name: 'ScreenUtil',
        //   builder: (context, child) => ScreenUtilInit(
        //     designSize: const Size(375, 812),
        //     minTextAdapt: true,
        //     splitScreenMode: true,
        //     useInheritedMediaQuery: true,
        //     builder: (context, child) => child!,
        //     child: child,
        //   ),
        // ),
      ],
      // appBuilder: (context, child) {
      //   return ScreenUtilInit(
      //     designSize: const Size(375, 812),
      //     minTextAdapt: true,
      //     splitScreenMode: true,
      //     useInheritedMediaQuery: true,
      //     builder: (context, child) => child!,
      //     child: child,
      //   );
      // },
      // integrations: [
      //   // To make addons & knobs work with Widgetbook Cloud
      //   WidgetbookCloudIntegration(),
      // ],
    );
  }
}
