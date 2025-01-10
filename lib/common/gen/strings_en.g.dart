///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Invoice';
	String get awards => TranslationOverrides.string(_root.$meta, 'awards', {}) ?? 'Awards';
	String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel';
	String get darkMode => TranslationOverrides.string(_root.$meta, 'darkMode', {}) ?? 'Dark mode';
	String get firstPrize => TranslationOverrides.string(_root.$meta, 'firstPrize', {}) ?? 'First Prize';
	String get grandPrize => TranslationOverrides.string(_root.$meta, 'grandPrize', {}) ?? 'Grand Prize';
	Map<String, String> get language => TranslationOverrides.map(_root.$meta, 'language') ?? {
		'en': 'English',
		'zh': 'Chinese',
	};
	String get lightMode => TranslationOverrides.string(_root.$meta, 'lightMode', {}) ?? 'Light mode';
	String get nothing => TranslationOverrides.string(_root.$meta, 'nothing', {}) ?? 'Nothing';
	String get number => TranslationOverrides.string(_root.$meta, 'number', {}) ?? 'Number';
	String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save';
	String get specialPrize => TranslationOverrides.string(_root.$meta, 'specialPrize', {}) ?? 'Special Prize';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Invoice';
			case 'awards': return TranslationOverrides.string(_root.$meta, 'awards', {}) ?? 'Awards';
			case 'cancel': return TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel';
			case 'darkMode': return TranslationOverrides.string(_root.$meta, 'darkMode', {}) ?? 'Dark mode';
			case 'firstPrize': return TranslationOverrides.string(_root.$meta, 'firstPrize', {}) ?? 'First Prize';
			case 'grandPrize': return TranslationOverrides.string(_root.$meta, 'grandPrize', {}) ?? 'Grand Prize';
			case 'language.en': return TranslationOverrides.string(_root.$meta, 'language.en', {}) ?? 'English';
			case 'language.zh': return TranslationOverrides.string(_root.$meta, 'language.zh', {}) ?? 'Chinese';
			case 'lightMode': return TranslationOverrides.string(_root.$meta, 'lightMode', {}) ?? 'Light mode';
			case 'nothing': return TranslationOverrides.string(_root.$meta, 'nothing', {}) ?? 'Nothing';
			case 'number': return TranslationOverrides.string(_root.$meta, 'number', {}) ?? 'Number';
			case 'save': return TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save';
			case 'specialPrize': return TranslationOverrides.string(_root.$meta, 'specialPrize', {}) ?? 'Special Prize';
			default: return null;
		}
	}
}

