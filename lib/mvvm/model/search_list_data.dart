import 'package:setup_mvvm_architechture/mvvm/model/client_data.dart';

class SearchListData {
  List<ClientData> searchData;

  SearchListData(this.searchData);

  static SearchListData fromJson(List<dynamic> json) {
    var data = json.map((i) => ClientData.fromJson(i)).toList();
    return SearchListData(data);
  }
}
