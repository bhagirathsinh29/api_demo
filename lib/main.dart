import 'package:api_demo/api_provider.dart';
import 'package:api_demo/user_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModelClass>>(
          future: ApiProviderClass.getUserListMethod(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${snapshot.data![index].id.toString()} : "),
                            // const Text('.'),
                            Text(
                                "${snapshot.data![index].originalTitle.toString()} : "),
                          ],
                        ),
                      ),
                      // subtitle: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //             snapshot.data![index].releaseDate.toString()),
                      //         // const Text('.'),
                      //         Text(
                      //           snapshot.data![index].overview.toString(),
                      //           overflow: TextOverflow.visible,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
