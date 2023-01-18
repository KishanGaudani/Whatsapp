// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'globals.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  TabController? tabController;
  PageController pageController = PageController();
  DateTime? SelectedDate;
  TimeOfDay? SelectTime;
  Duration? duration;
  bool isIos = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text(
                  "WhatsApp",
                  style: TextStyle(color: Color(0xff8596a0), fontSize: 23),
                ),
                backgroundColor: const Color(0xff1f2c34),
                trailing: const Icon(
                  Icons.more_vert_outlined,
                  color: Color(0xff8596a0),
                ),
                leading: CupertinoSwitch(
                  thumbColor: const Color(0xff00a884),
                  activeColor: const Color(0xff8596a0),
                  value: isIos,
                  onChanged: (val) {
                    setState(() {
                      isIos = val;
                    });
                  },
                ),
              ),
              child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                  backgroundColor: Colors.white,
                  inactiveColor: const Color(0xff8596a0),
                  activeColor: const Color(0xff00a884),
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.call,
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                tabBuilder: (context, i) {
                  return IndexedStack(
                    index: i,
                    children: [
                      Container(
                        child: ListView.builder(
                          itemCount: Globals.allContact.length,
                          itemBuilder: (context, i) => Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 2, top: 2),
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(Globals.allContact[i]['image']),
                              ),
                              title: Text(
                                "${Globals.allContact[i]['title']}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              subtitle: Text(
                                Globals.allContact[i]['subtitle'],
                                style: const TextStyle(
                                    color: Color(0xff8596a0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Text(
                                Globals.allContact[i]['time'],
                                style: const TextStyle(
                                    color: Color(0xff8596a0), fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                          itemCount: Globals.allContact.length,
                          itemBuilder: (context, i) => Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 2, top: 2),
                            color: Colors.white,
                            child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      Globals.allContact[i]['image']),
                                ),
                                title: Text(
                                  "${Globals.allContact[i]['title']}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Icon(Icons.call_received)],
                                ),
                                trailing: const Icon(
                                  Icons.video_camera_back,
                                  color: Color(0xff00a884),
                                  size: 27,
                                )),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: ListView.builder(
                              itemCount: Globals.allContact.length,
                              itemBuilder: (context, i) => ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      Globals.allContact[i]['image']),
                                ),
                                title: Text(
                                  "${Globals.allContact[i]['title']}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  Globals.allContact[i]['time'],
                                  style: const TextStyle(
                                      color: Color(0xff8596a0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                backgroundColor: Colors.white,
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "WhatsApp",
                    style: TextStyle(color: Color(0xff8596a0), fontSize: 23),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Switch(
                      inactiveThumbColor: const Color(0xff00a884),
                      inactiveTrackColor: const Color(0xff8596a0),
                      value: isIos,
                      onChanged: (val) {
                        setState(() {
                          isIos = val;
                        });
                      }),
                  actions: const [
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Color(0xff8596a0),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xff8596a0),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Color(0xff8596a0),
                    ),
                  ],
                  bottom: TabBar(
                    controller: tabController!,
                    unselectedLabelColor: const Color(0xff8596a0),
                    labelColor: const Color(0xff00a884),
                    indicatorColor: const Color(0xff00a884),
                    tabs: const [
                      Tab(
                        child: Text(
                          "CHATS",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "CALLS",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: Globals.allContact.length,
                        itemBuilder: (context, i) => ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(Globals.allContact[i]['image']),
                          ),
                          title: Text(
                            "${Globals.allContact[i]['title']}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            Globals.allContact[i]['subtitle'],
                            style: const TextStyle(
                                color: Color(0xff8596a0),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            Globals.allContact[i]['time'],
                            style: const TextStyle(
                                color: Color(0xff8596a0), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: Globals.allContact.length,
                        itemBuilder: (context, i) => ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage(Globals.allContact[i]['image']),
                            ),
                            title: Text(
                              "${Globals.allContact[i]['title']}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.call_received,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.video_camera_front_outlined,
                              color: Color(0xff00a884),
                              size: 27,
                            )),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: Globals.allContact.length,
                        itemBuilder: (context, i) => ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(Globals.allContact[i]['image']),
                          ),
                          title: Text(
                            "${Globals.allContact[i]['title']}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            Globals.allContact[i]['time'],
                            style: const TextStyle(
                                color: Color(0xff8596a0),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
            ),
          );
  }
}
