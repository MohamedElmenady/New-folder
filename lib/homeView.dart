import 'package:flutter/material.dart';
import 'package:new_app/Layout/provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provid = Provider.of<News>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('General News'),
      ),
      body: provid.newModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 22,
              itemBuilder: (context, index) {
                return Consumer<News>(builder: (context, moh, child) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          child: Image.network(
                            moh.newModel[index].image!,
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            moh.newModel[index].title!,
                            maxLines: 1,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
    );
  }
}
