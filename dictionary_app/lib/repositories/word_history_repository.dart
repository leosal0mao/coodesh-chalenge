import '../services/my_local_storage.dart';

class WordHistoryRepository {
  final MyLocalStorage localStorage;

  WordHistoryRepository({required this.localStorage});

  Future<List<Map<String, dynamic>>> getAllItemsFromLocalStorage() async {
    return await localStorage.getAllLocalData();
  }
}
