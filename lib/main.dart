import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/common/gen/strings.g.dart';
import 'package:invoice/common/i18n/l10n.dart';
import 'package:invoice/common/util/logger/logger.dart';
import 'package:invoice/common/util/logger/normal_log.dart';
import 'package:invoice/data/db/object_box_helper.dart';
import 'package:invoice/ui/router/app_router.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/theme/theme_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ObjectBoxHelper.init();

  await L10n.init();

  Logger.instance.log(NormalLog.debug(message: "App start"));

  runApp(ProviderScope(
    child: ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: TranslationProvider(
        child: const InvoiceApp(),
      ),
    ),
  ));
}

class InvoiceApp extends ConsumerWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.byDefault();

    final trProvider = TranslationProvider.of(context);
    L10n.setTranslation(trProvider.translations);

    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: "Invoice",
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: themeMode.value,
      locale: TranslationProvider.of(context).flutterLocale,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      routerConfig: appRouter.config(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: child!,
      ),
    );
  }
}
