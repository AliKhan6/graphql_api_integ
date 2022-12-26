import 'package:graphql_api_example/core/models/data.dart';

class DataResponse {
  List<Data> data = [];

  DataResponse(this.data);

  DataResponse.fromJson(json) {
    if (json["users"].isNotEmpty) {
      data = [];
      json["users"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }
}
