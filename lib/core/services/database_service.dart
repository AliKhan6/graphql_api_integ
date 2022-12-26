import 'package:dio/dio.dart' as dio;
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql_api_example/core/constants/end_points.dart';
import 'package:graphql_api_example/core/response/data_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../constants/queries.dart';

class DatabaseService {
  final client = dio.Dio();

  Future<DataResponse> getData() async {
    print("GetData");
    DataResponse dataResponse = DataResponse([]);
    final Link link = DioLink(
      "$baseUrl$endPoint",
      client: client,
      defaultHeaders: {
        "content-type": "application/json",
        "service": "in-vfleet-uf-webapi",
        "Accept": "application/json",
      },
    );
    final res = await link
        .request(Request(
          operation: Operation(document: gql(query)),
        ))
        .first;
    print("GotData ${res.data}");
    dataResponse = DataResponse.fromJson(res.data);
    return dataResponse;
  }
}
