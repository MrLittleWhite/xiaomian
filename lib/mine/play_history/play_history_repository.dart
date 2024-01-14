import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xiaomian/model/audio_item.dart';

class PlayHistoryRepository {

  late Isar? _isar;
  
  PlayHistoryRepository._internal();

  static final PlayHistoryRepository _instance = PlayHistoryRepository._internal();

  factory PlayHistoryRepository() => _instance;

  Future<Isar> initialize() async {
    if (_isar != null) {
      return Future(() => _isar!);
    }
    return getApplicationDocumentsDirectory().then((value) => Isar.open([AudioItemSchema], directory: '$value/isarDataBase')).then((value) {
      _instance._isar = value;
      return value;
    });
  }

  Future<AudioItem?> getFirstItem() async {
    return initialize().then((value) => value.audioItems.where().sortByCreateTime().findFirst());
  }
}