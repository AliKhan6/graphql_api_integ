import 'package:flutter/material.dart';
import 'package:graphql_api_example/core/response/data_response.dart';
import 'package:graphql_api_example/core/services/database_service.dart';

class MainScreenViewModel extends ChangeNotifier {
  DatabaseService databaseService = DatabaseService();
  bool isloading = true;
  DataResponse dataResponse = DataResponse([]);
  MainScreenViewModel() {
    getData();
  }

  getData() async {
    dataResponse = await databaseService.getData();
    print(dataResponse.data.length);
    isloading = false;
    notifyListeners();
  }
}
