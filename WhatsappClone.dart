import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WhClone(),
    );
  }
}

class WhClone extends StatefulWidget {
  const WhClone({Key? key}) : super(key: key);

  @override
  State<WhClone> createState() => _WhCloneState();
}

class _WhCloneState extends State<WhClone> {
  int currentIndex = 0;

  Widget chatsScreen = ChatScreen("Mom");
  Widget statusScreen = StatusScreen();
  Widget callsScreen = CallsScreen();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
            ),
          ),
          backgroundColor: Color(0xFF333333),
          bottom: TabBar(
            indicatorColor: Colors.green,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              _buildTab("Chats", 0),
              _buildTab("Status", 1),
              _buildTab("Calls", 2),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle option selection
                print("Selected: $value");
              },
              color: Color(0xFF333333),
              itemBuilder: (BuildContext context) => [
                buildPopupMenuItem('New Group'),
                buildPopupMenuItem('New Broadcast'),
                buildPopupMenuItem('Linked Devices'),
                buildPopupMenuItem('Starred Messages'),
                buildPopupMenuItem('Settings'),
              ],
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              offset: Offset(0, 60),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            chatsScreen,
            statusScreen,
            callsScreen,
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: currentIndex == index ? Colors.green : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

PopupMenuItem<String> buildPopupMenuItem(String title) {
  return PopupMenuItem<String>(
    value: title.toLowerCase().replaceAll(' ', '_'),
    child: Container(
      color: Color(0xFF333333),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> contacts = ["Mom", "Dad", "Friend1", "Friend2", "Friend3"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = contacts
        .where((contact) => contact.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(suggestionList[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String Mom;

  ChatScreen(this.Mom);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 40),
              ),
              title: Text(
                "Mom",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all, color: Colors.white),
                  SizedBox(width: 3),
                  Text(
                    "hooyo Asc",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the other screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactScreen(),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            Center(
              child: Icon(
                Icons.chat,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the Scaffold
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.black,
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/user1.jpg'),
            ),
            title: Text(
              'John Doe',
              style: TextStyle(color: Colors.white), // Setting text color
            ),
            subtitle: Text(
              '2 minutes ago',
              style: TextStyle(color: Colors.white), // Setting text color
            ),
            trailing: Icon(
              Icons.more_horiz,
              color: Colors.white, // Setting icon color
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/user2.jpg'),
            ),
            title: Text(
              'Jane Smith',
              style: TextStyle(color: Colors.white), // Setting text color
            ),
            subtitle: Text(
              '1 hour ago',
              style: TextStyle(color: Colors.white), // Setting text color
            ),
            trailing: Icon(
              Icons.more_horiz,
              color: Colors.white, // Setting icon color
            ),
          ),
        ],
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the Scaffold

      body: Center(
        child: Text(
          "Calls Screen Content",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the Scaffold

      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "6 contacts",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
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
      body: Center(
        child: Text("This is your other screen content"),
      ),
    );
  }
}
