import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Preference with EquatableMixin {
  @Id()
  int id;
  final int themeModeIndex;
  final String languageCode;

  Preference({
    this.id = 0,
    required this.themeModeIndex,
    required this.languageCode,
  });

  factory Preference.byDefault() => Preference(
        themeModeIndex: 0,
        languageCode: "en",
      );

  Preference copyWith({
    int? themeModeIndex,
    String? languageCode,
  }) =>
      Preference(
        id: id,
        themeModeIndex: themeModeIndex ?? this.themeModeIndex,
        languageCode: languageCode ?? this.languageCode,
      );

  @override
  List<Object?> get props => [
        themeModeIndex,
        languageCode,
      ];
}
