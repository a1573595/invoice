import 'package:invoice/data/db/objectbox.g.dart';
import 'package:invoice/data/db/preference_dao_impl.dart';
import 'package:invoice/data/model/preference.dart';
import 'package:invoice/domain/db/preference_dao.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxHelper {
  const ObjectBoxHelper._();

  static late final Store _store;

  static late final PreferenceDao _preferenceDao;

  static PreferenceDao get preferenceDao => _preferenceDao;

  static Future<void> init() => getApplicationDocumentsDirectory()
      .then((value) => openStore(directory: "${value.path}/object_box"))
      .then((value) => _store = value)
      .then((value) => Box<Preference>(value))
      .then((value) => _preferenceDao = PreferenceDaoImpl(value));

  static void close() => _store.close();
}
