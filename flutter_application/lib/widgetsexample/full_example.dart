import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
//import 'package:flutter/services.dart';

// class Favor {
//   String? description;
//   Favor({this.description});

//   bool get isCompleted => null;
//}

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
        body: TabBarView(
          children: [
            //const Text('Hello'),
            _favorsList('Pending Requests', ['answers']),
            _favorsList('Doing', ['answers']),
            _favorsList('Completed', ['answers']),
            _favorsList('Refused', ['answers'])
            // _favorsList('Pending Requests', pendingAnswerFavors!),
            // _favorsList('Doing', acceptedFavors!),
            // _favorsList('Completed', completedFavors!),
            // _favorsList('Refused', refusedFavors!)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
                key: ValueKey(favor.uuid.v4()),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //_itemHeader(favor),
                      Text(favor.description),
                      //_itemFooter(favor)
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

// Row _itemHeader(favor) {
//   return Row(
//     children: [
//       const CircleAvatar(
//           //backgroundColor: NetworkImage('url'),
//           ),
//       Expanded(
//           child: Padding(
//         padding: const EdgeInsets.only(left: 8),
//         child: Text('${favor.friend.name} asked you to....'),
//       ))
//     ],
//   );
// }

// Widget _itemFooter(favor) {
//   if (favor.isCompleted) {
//     //final format = DateFormat();
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       alignment: Alignment.centerRight,
//       child: const Chip(
//         label: Text('Completed at: {format.format(favor.completed)}'),
//       ),
//     );
//   }
//   if (favor.isRequested) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('Refuse'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('Complete'),
//         )
//       ],
//     );
//   }
//   if (favor.isDoing) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('give up'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('Complete'),
//         )
//       ],
//     );
//   }
//   return Container();
// }

// class RequestFavourPage extends StatelessWidget {
//   final List? friends;
//   const RequestFavourPage({Key? key, this.friends}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Requesting a favor"),
//         leading: const CloseButton(),
//         actions: [ElevatedButton(onPressed: () {}, child: const Text('Save'))],
//       ),
//       body: Column(
//         children: [
//           DropdownButtonFormField(
//             items: friends!
//                 .map(
//                   (e) => DropdownMenuItem(
//                     child: Text(e.name),
//                   ),
//                 )
//                 .toList(),
//             onChanged: (dynamic) {},
//           ),
//           TextFormField(
//             maxLines: 5,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(200),
//             ],
//           ),
//           //InputDatePickerFormField(firstDate: firstDate, lastDate: lastDate)
//         ],
//       ),
//     );
//   }
// }

// class FavorCardItem extends StatelessWidget {
//   //final Favor favor;
//   const FavorCardItem({Key? key, this.favor}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
