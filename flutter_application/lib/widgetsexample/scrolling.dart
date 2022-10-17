import 'package:flutter/material.dart';
import 'package:flutter_application/widgetsexample/animationex.dart';
import 'package:flutter_application/widgetsexample/contact_page.dart';
import 'package:flutter_application/widgetsexample/http_tutorial.dart';

class TabScrolling extends StatefulWidget {
  const TabScrolling({super.key});

  @override
  State<TabScrolling> createState() => _TabScrollingState();
}

class _TabScrollingState extends State<TabScrolling>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RestorableInt tabIndex = RestorableInt(0);

  @override
  // ignore: override_on_non_overriding_member
  String get restorationId => 'tab_scrolling';

  @override
  // ignore: override_on_non_overriding_member
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    //registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Scrolling of some Widgets',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 239, 243, 4)),
          ),
          backgroundColor: const Color.fromARGB(255, 87, 50, 37),
          bottom: TabBar(
              labelColor: const Color.fromARGB(255, 0, 238, 8),
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Text(
                  'Contact Page',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Second Tab',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Third Tab',
                  style: TextStyle(fontSize: 18),
                ),
              ]),
        ),
        body: Center(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ContactPage(),
              FadeTest(),
              Myhttpexa(),
            ],
          ),
        ),
      ),
    );
  }
}
