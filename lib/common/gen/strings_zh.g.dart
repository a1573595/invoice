///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	// Translations
	@override String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '發票';
	@override String get awards => TranslationOverrides.string(_root.$meta, 'awards', {}) ?? '獎項';
	@override String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '取消';
	@override String get darkMode => TranslationOverrides.string(_root.$meta, 'darkMode', {}) ?? '深色模式';
	@override String get firstPrize => TranslationOverrides.string(_root.$meta, 'firstPrize', {}) ?? '頭獎';
	@override String get grandPrize => TranslationOverrides.string(_root.$meta, 'grandPrize', {}) ?? '特獎';
	@override String get lightMode => TranslationOverrides.string(_root.$meta, 'lightMode', {}) ?? '亮色模式';
	@override Map<String, String> get language => TranslationOverrides.map(_root.$meta, 'language') ?? {
		'en': '英文',
		'zh': '中文',
	};
	@override String get nothing => TranslationOverrides.string(_root.$meta, 'nothing', {}) ?? '沒有東西';
	@override String get number => TranslationOverrides.string(_root.$meta, 'number', {}) ?? '號碼';
	@override String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '儲存';
	@override String get specialPrize => TranslationOverrides.string(_root.$meta, 'specialPrize', {}) ?? '特別獎';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '發票';
			case 'awards': return TranslationOverrides.string(_root.$meta, 'awards', {}) ?? '獎項';
			case 'cancel': return TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '取消';
			case 'darkMode': return TranslationOverrides.string(_root.$meta, 'darkMode', {}) ?? '深色模式';
			case 'firstPrize': return TranslationOverrides.string(_root.$meta, 'firstPrize', {}) ?? '頭獎';
			case 'grandPrize': return TranslationOverrides.string(_root.$meta, 'grandPrize', {}) ?? '特獎';
			case 'lightMode': return TranslationOverrides.string(_root.$meta, 'lightMode', {}) ?? '亮色模式';
			case 'language.en': return TranslationOverrides.string(_root.$meta, 'language.en', {}) ?? '英文';
			case 'language.zh': return TranslationOverrides.string(_root.$meta, 'language.zh', {}) ?? '中文';
			case 'nothing': return TranslationOverrides.string(_root.$meta, 'nothing', {}) ?? '沒有東西';
			case 'number': return TranslationOverrides.string(_root.$meta, 'number', {}) ?? '號碼';
			case 'save': return TranslationOverrides.string(_root.$meta, 'save', {}) ?? '儲存';
			case 'specialPrize': return TranslationOverrides.string(_root.$meta, 'specialPrize', {}) ?? '特別獎';
			default: return null;
		}
	}
}

