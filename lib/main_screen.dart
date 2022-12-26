import 'package:flutter/material.dart';
import 'package:graphql_api_example/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenViewModel(),
      child: Consumer<MainScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Graphql Example")),
            body: model.isloading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: model.dataResponse.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Name: ${model.dataResponse.data[index].firstName}"),
                                      const SizedBox(height: 8),
                                      Text(
                                          "Background Color: ${model.dataResponse.data[index].backgroundColor}"),
                                      const SizedBox(height: 8),
                                      Text(
                                          "Block Number: ${model.dataResponse.data[index].blockNumber}"),
                                      const SizedBox(height: 8),
                                      Text(
                                          "Instagram Link: ${model.dataResponse.data[index].instagram ?? ""}"),
                                      const SizedBox(height: 8),
                                      Text(
                                          "Followers: ${model.dataResponse.data[index].followedUsers ?? ""}"),
                                      const SizedBox(height: 8),
                                      Text(
                                          "Following: ${model.dataResponse.data[index].followingUsers ?? ""}"),
                                      const SizedBox(height: 8),
                                      // ignore: prefer_const_constructors
                                      Text("Tags are: "),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                          height: 40,
                                          child: ListView.builder(
                                              itemCount: model.dataResponse
                                                  .data[index].tags!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, ind) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 12.0),
                                                  child: Text(model.dataResponse
                                                      .data[index].tags![ind]),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
