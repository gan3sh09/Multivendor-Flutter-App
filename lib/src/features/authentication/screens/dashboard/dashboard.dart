import 'package:flutter/material.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/search_widget.dart';
import 'widgets/body.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ), */
      body: Body(),
    );
  }
}
