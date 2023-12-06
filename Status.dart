import 'package:flutter/material.dart';

class WhClone extends StatefulWidget {
  const WhClone({super.key});

  @override
  State<WhClone> createState() => _WhCloneState();
}

class _WhCloneState extends State<WhClone> {
  int currentIndex = 0;
  // index aad kula soconeeso navigation-ka la maryaayo
  List screens = [
    const Text("Chats"),
    const Text("Status"),
    const Text("Cals"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // halkaan ka sheeg tirada tabs ka aad rabto(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(
                letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color(0xFF333333),
          bottom: const TabBar(indicatorColor: Colors.lightGreenAccent, tabs: [
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ]),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle message action
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options action
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("Mom"),
              subtitle: const Text("hooyo Asc"),
              trailing: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}
