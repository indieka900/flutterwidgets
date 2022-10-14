import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My favour to doApp',
      // home: FavoursPage(
      //   pendingAnswersFavour: mockPendingFavours,
      //   completedFavours: mockCompletedFavours,
      //   refusedFavours: mockRefusedFavours,
      //   acceptedFavours: mockDoingFavours,
      // ),
    );
  }
}

class FavoursPage extends StatelessWidget {
  final List? pendingAnswerFavors;
  final List? acceptedFavors;
  final List? completedFavors;
  final List? refusedFavors;
  const FavoursPage({
    Key? key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFavors,
    this.refusedFavors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your favours all here'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              _buildCategoryTab('Requests'),
              _buildCategoryTab('Doing'),
              _buildCategoryTab('Completed'),
              _buildCategoryTab('Refused'),
            ],
          ),
        ),
        body: TabBarView(children: [
          _favorsList('Pending Requests', pendingAnswerFavors!),
          _favorsList('Doing', acceptedFavors!),
          _favorsList('Completed', completedFavors!),
          _favorsList('Refused', refusedFavors!)
        ],),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        tooltip: 'Ask a favour',
        child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title) {
    return Tab(
      child: Text(title),
    );
  }

  Widget _favorsList(String title, List favors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(title),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final favor = favors[index];
              return Card(
                key: ValueKey(favor.uuid),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _itemHeader(favor),
                      Text(favor.description),
                      _itemFooter(favor)
                    ],
                  ),
                ),
              );
            },
            physics: const BouncingScrollPhysics(),
            itemCount: favors.length,
          ),
        )
      ],
    );
  }
}
