import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/common/gen/strings.g.dart';
import 'package:invoice/common/i18n/l10n.dart';
import 'package:invoice/ui/screen/home/home_view_model.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/theme/theme_mode_provider.dart';
import 'package:invoice/ui/theme/widget_style.dart';
import 'package:invoice/ui/widget/body/error_body.dart';
import 'package:invoice/ui/widget/body/loading_body.dart';
import 'package:invoice/ui/widget/gaps.dart';
import 'package:invoice/ui/widget/picker/text_picker.dart';
import 'package:invoice/ui/widget/refresh_indicator/three_bounce_refresh_indicator.dart';
import 'package:invoice/ui/widget/text_segmented_control.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useRef(GlobalKey<ScaffoldState>());

    return Scaffold(
      key: scaffoldKey.value,
      drawer: Drawer(
        child: Padding(
          padding: WidgetStyle.screenHorizontalPadding,
          child: Column(
            spacing: 12.r,
            children: [
              SizedBox(
                height: kToolbarHeight,
              ),
              SizedBox(
                width: double.infinity,
                child: const _ThemeModeSegmentedControl(),
              ),
              Gaps.h12,
              _LanguagePicker(scaffoldKey.value),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(L10n.tr.appName),
      ),
      body: ThreeBounceRefreshIndicator(
        onRefresh: () => ref.refresh(homeUiStateProvider.future),
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(homeUiStateProvider).when(
                  data: (data) => child!,
                  error: (error, stackTrace) => ErrorBody(
                    error: error,
                    stackTrace: stackTrace,
                  ),
                  loading: () => LoadingBody(),
                );
          },
          child: _Body(),
        ),
      ),
    );
  }
}

class _ThemeModeSegmentedControl extends HookConsumerWidget {
  const _ThemeModeSegmentedControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = useMemoized(() => {
          ThemeMode.light: L10n.tr.lightMode,
          ThemeMode.dark: L10n.tr.darkMode,
        });

    return TextSegmentedControl<ThemeMode>(
      children: children,
      groupValue: ref.watch(themeModeProvider).value,
      onChanged: ref.read(themeModeProvider).toggleThemeMode,
    );
  }
}

class _LanguagePicker extends HookWidget {
  const _LanguagePicker(this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() => {
          for (final locale in AppLocaleUtils.supportedLocales) locale: (L10n.tr.language[locale.toString()] as String),
        });

    return TextPicker(
      children: children,
      initialValue: TranslationProvider.of(context).flutterLocale,
      onChanged: (value) {
        L10n.setLanguage(value);

        scaffoldKey.currentState?.closeDrawer();
      },
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceNumber = ref.read(homeUiStateProvider).requireValue;

    return Padding(
      padding: WidgetStyle.screenPadding,
      child: Column(
        children: [
          Text(
            "${invoiceNumber.year} / ${invoiceNumber.month} - ${invoiceNumber.month + 1}",
            style: context.appTextTheme.titleLarge,
          ),
          Gaps.h16,
          Table(
            border: TableBorder.all(
              color: context.appColorTheme.onSurface,
            ),
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: WidgetStyle.tableVerticalPadding,
                      child: Text(
                        L10n.tr.awards,
                        style: context.appTextTheme.titleMedium,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        L10n.tr.number,
                        style: context.appTextTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: WidgetStyle.tableVerticalPadding,
                      child: Text(
                        L10n.tr.specialPrize,
                        style: context.appTextTheme.titleSmall,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        invoiceNumber.specialPrize,
                        style: context.appTextTheme.content,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: WidgetStyle.tableVerticalPadding,
                      child: Text(
                        L10n.tr.grandPrize,
                        style: context.appTextTheme.titleSmall,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        invoiceNumber.grandPrize,
                        style: context.appTextTheme.content,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Text(
                        L10n.tr.firstPrize,
                        style: context.appTextTheme.titleSmall,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: WidgetStyle.tableVerticalPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            invoiceNumber.firstPrizeList.length,
                            (index) => Text(
                              invoiceNumber.firstPrizeList[index],
                              style: context.appTextTheme.content,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
