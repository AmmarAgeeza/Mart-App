abstract class CacheConsumer {
  //get
  dynamic getData({required String key});

  //save
  dynamic saveData({required String key, required dynamic value});
  //remove Data
  dynamic removeData({required String key});
  //put data
  dynamic put({required String key, required dynamic value});
  //clear
  dynamic clearData();
}
