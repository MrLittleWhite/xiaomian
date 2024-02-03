import 'package:isar/isar.dart';
import 'package:xiaomian/component/xm_directory.dart';
import 'package:xiaomian/model/audio_item.dart';

class PlayHistoryRepository {

  Isar? _isar;
  
  PlayHistoryRepository._internal();

  static final PlayHistoryRepository _instance = PlayHistoryRepository._internal();

  factory PlayHistoryRepository() => _instance;
  
  int? count;

  Future<Isar> _initialize() async {
    if (_isar != null) {
      return Future(() => _isar!);
    }
    
    return XMDirectory.documents.then((value) => XMDirectory.createIfPathNotExists('${value.path}/isarDataBase')).then((value) {
      return Isar.open([AudioItemSchema], directory: value);
    }).then((value) {
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

  Future<void> delete(List<AudioItem> items) async {
    return _initialize().then((value) => value.writeTxn(() => value.audioItems.deleteAll(items.map((e) => e.id).toList())));
  }
  Future<void> deleteIds(List<int> ids) async {
    return _initialize().then((value) => value.writeTxn(() => value.audioItems.deleteAll(ids)));
  }

  Future<void> deleteAll() async {
    return _initialize().then((value) => value.writeTxn(() => value.audioItems.clear()));
  }
}