import 'dart:convert';

import '../common/storage.dart';

class SearchService {
  static setSearchData(value) async {
    try {
      var str = await Storage.getString("searchList");
      if (str.isEmpty) {
        str = "[]";
      }
      var searchList = jsonDecode(str);
      var list = [];
      if (searchList.isNotEmpty) {
        list = searchList.toList();
      }
      if (list.contains(value)) {
        list.remove(value);
      }
      list.add(value);
      await Storage.setString("searchList", jsonEncode(list));
    } catch (e) {
      var list = [];
      list.add(value);
      await Storage.setString("searchList", jsonEncode(list));
    }
  }

  static removeSearchData(value) async {
    try {
      var str = await Storage.getString("searchList");
      if (str.isEmpty) {
        return;
      }
      var searchList = jsonDecode(str);
      var list = [];
      if (searchList.isNotEmpty) {
        list = searchList.toList();
        list.remove(value);
        await Storage.setString("searchList", jsonEncode(list));
      }
    } catch (e) {
      // 忽略异常
    }
  }

  static getSearchData() async {
    try {
      var str = await Storage.getString("searchList");
      if (str.isEmpty) {
        return [];
      }
      var searchList = jsonDecode(str);
      if (searchList.isNotEmpty) {
        return searchList.toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  static clearSearchData() async {
    await Storage.remove("searchList");
  }
}
