// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/src/refresh_indicator.dart' as _i2;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'widget',
        children: [
          _i1.WidgetbookFolder(
            name: 'refresh_indicator',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'RefreshIndicator',
                useCase: _i1.WidgetbookUseCase(
                  name: 'ThreeBounceRefreshIndicator',
                  builder: _i2.threeBounceRefreshIndicator,
                ),
              )
            ],
          )
        ],
      )
    ],
  )
];
