import 'package:demo_app/tab1.dart';
import 'package:demo_app/tab2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('assets/images/img.png',height: 50, width: 50),
              const SizedBox(width: 190),
              Image.asset('assets/images/search.png',height: 50, width: 50),
              const SizedBox(width: 10),
              Image.asset('assets/images/noti.png',height: 50, width: 50),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,


        ),
        body:
        Container(color: Colors.white54,
          child: Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    Row(
                        children: const [
                          Text('Mục tiêu công ty',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,

                              )
                          ),
                          SizedBox(width: 50),
                          Text('Xem thêm >',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue
                              )
                          ),
                        ]
                    ),
                    Container(
                      child: TabBar(
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Năm',
                          ),
                          Tab(
                            text: 'Quý',
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child:  TabBarView(
                        controller: tabController,
                        children: const [
                          Tab1(),
                          Tab2(),
                        ],
                      ),
                    )
                  ]
              ),

            ),
          ),
        ));
  }
}
