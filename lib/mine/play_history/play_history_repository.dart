import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xiaomian/model/audio_item.dart';

class PlayHistoryRepository {

  late Isar? _isar;
  
  PlayHistoryRepository._internal();

  static final PlayHistoryRepository _instance = PlayHistoryRepository._internal();

  factory PlayHistoryRepository() => _instance;
  
  int? count;

  Future<Isar> _initialize() async {
    if (_isar != null) {
      return Future(() => _isar!);
    }
    return getApplicationDocumentsDirectory().then((value) => Isar.open([AudioItemSchema], directory: '$value/isarDataBase')).then((value) {
      _instance._isar = value;
      return value;
    });
  }

  Future<AudioItem?> getFirstItem() async {
    return _initialize().then((value) => value.audioItems.where().sortByCreateTimeDesc().findFirst());
  }

  Future<void> insert(AudioItem item) async {
    return _initialize().then(
      (value) => value.writeTxn(() => value.audioItems.put(item))
    ).then( (value) {
      if (count != null) {
        count = count! + 1;
        return _initialize();
      } else {
        return getAll().then((value) {
          return _initialize();
        });
      }
    }).then((value) {
      if (count! > 50) {
        return value.audioItems.where().sortByCreateTime().deleteFirst();
      }
      return Future(() => null);
    });
  }

  Future<List<AudioItem>> getAll() async {
    return _initialize().then((value) => value.audioItems.where().findAll()).then((value) {
      count = value.length;
      return Future(() => value);
    });
  }

  Future<void> delete(AudioItem item) async {
    return _initialize().then((value) => value.writeTxn(() => value.audioItems.delete(item.id)));
  }
}