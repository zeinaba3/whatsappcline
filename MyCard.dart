// import 'package:flutter/material.dart';

// class MyCard extends StatelessWidget {
//   const MyCard({super.key, this.title, required this.icon});
//   final String? title;
//   final IconData icon;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//           // color: Colors.red
//           border: Border.all(color: Colors.black)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(title ?? "")
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class LessonNine extends StatefulWidget {
  const LessonNine({super.key});

  @override
  State<LessonNine> createState() => _LessonNineState();
}

class _LessonNineState extends State<LessonNine> {
  int currentIndex = 0;
  // index aad kula soconeeso navigation-ka la maryaayo
  List screens = [
    const Text("Home"),
    const Text("Classes"),
    const Text("Search"),
    const Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // halkaan ka sheeg tirada tabs ka aad rabto
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text("Drawer Header"),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pop(context),
                leading: const Icon(Icons.home),
                title: const Text("Home"),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Lesson nine"),
          backgroundColor: Colors.orange,
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              text: "Chats",
            ),
            Tab(
              icon: Icon(Icons.balance),
            ),
            Tab(
              icon: Icon(Icons.call),
            )
          ]),
        ),
        // body: const TabBarView(
        //   children: [
        //     Center(child: Text("Home screen")),
        //     Center(child: Text("Judge screen")),
        //     Center(child: Text("Calls screen")),
        //   ],
        // ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("CA20 Classes"),
              subtitle: const Text("Flutter course"),
              trailing: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}
