import 'package:flutter/material.dart';

import '../resources/app_drawer.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key,});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Reviews',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: const AppDrawer(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Container(
                  width: 100,height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.deepOrange[300],
                        ),
                        child: const Icon(Icons.account_circle_rounded,color: Colors.white,size: 50,),
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Lorem ipsum',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.star_outline_sharp),
                              ),
                              IconButton(
                                onPressed: () {}, icon: const Icon(Icons.star_outline_sharp),
                              ),
                              IconButton(
                                onPressed: () {}, icon: const Icon(Icons.star_outline_sharp),
                              ),
                              IconButton(
                                onPressed: () {}, icon: const Icon(Icons.star_outline_sharp),
                              ),
                              IconButton(
                                onPressed: () {}, icon: const Icon(Icons.star_outline_sharp),
                              ),
                            ],),
                          const SizedBox(height: 10,),
                          const Text('Your productLorem ipsum dolor sit',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                          const Text('amet, consectetuer adipiscing elit,',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                          const Text('sed diam nonummy nibh euismod',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                          const Text('tincidunt ut laoreet dolore magna',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                          const Text('aliquam erat',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),

                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            scrollDirection: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
