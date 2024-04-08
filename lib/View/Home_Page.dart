import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:imperointerview/Provider/DataProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<DataProvider>(context, listen: true);
    useEffect(() {
      notifier.fetchData();
    }, []);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        // bottom: TabBar(
        //   tabs: <Widget>[
        //     ...notifier.category.map((e) {
        //       return Text(e['Name'].toString());
        //     })
        //   ],
        // ),
        title: Text(
          'ESP Tiles',
          style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(IconlyBold.filter, size: 20.w, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(IconlyLight.search, size: 20.w, color: Colors.white),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: SizedBox.expand(
          child: ColoredBox(
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
              itemCount: notifier.category.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifier.category[index].name.toString(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Image.network(
                          notifier.category[index].subCategories![index]
                              .product![index].imageName
                              .toString(),
                          width: 150.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                        ),
                        Text(notifier.category[index].subCategories![index]
                            .product![index].name
                            .toString()),
                      ],
                    ),
                  ],
                );
              },
            ),
            // child: TabBarView(
            //   children: <Widget>[
            //     ...notifier.category.map((e) {
            //       return Container(
            //         color: Colors.black,
            //         width: width * 0.2,
            //         height: height * 0.5,
            //         child: Text(
            //           e['Name'].toString(),
            //           style: const TextStyle(color: Colors.black),
            //         ),
            //       );
            //     }),
            //     // ...List.generate(10, (index) {
            //     //   return CustomWidget(id);
            //     // }),
            //     // Container(
            //     //   color: Colors.red,
            //     //   child: const Center(
            //     //     child: Text(
            //     //       'Page 1',
            //     //       style: TextStyle(
            //     //         color: Colors.white,
            //     //         fontSize: 24.0,
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //     // Container(
            //     //   color: Colors.blue,
            //     //   child: const Center(
            //     //     child: Text(
            //     //       'Page 2',
            //     //       style: TextStyle(
            //     //         color: Colors.white,
            //     //         fontSize: 24.0,
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //     // Container(
            //     //   color: Colors.green,
            //     //   child: const Center(
            //     //     child: Text(
            //     //       'Page 3',
            //     //       style: TextStyle(
            //     //         color: Colors.white,
            //     //         fontSize: 24.0,
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //     // Container(
            //     //   color: Colors.green,
            //     //   child: const Center(
            //     //     child: Text(
            //     //       'Page 3',
            //     //       style: TextStyle(
            //     //         color: Colors.white,
            //     //         fontSize: 24.0,
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
