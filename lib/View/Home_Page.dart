import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:imperointerview/Provider/DataProvider.dart';
import 'package:imperointerview/View/SubCategoryView.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<DataProvider>(context, listen: true);
    useEffect(() {
      /// micro task help us call api in hooks
      Future.microtask(() {
        notifier.loadCategory();
      });
      return () {};
    }, []);
    return DefaultTabController(
      length: notifier.category.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: notifier.isLoading
              ? null
              : TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  padding: const EdgeInsets.only(bottom: 10),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  dividerColor: Colors.black,
                  tabAlignment: TabAlignment.start,
                  tabs: <Widget>[
                    ...notifier.category.map((e) {
                      return Text(e['Name'].toString());
                    })
                  ],
                ),
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
                  icon:
                      Icon(IconlyBold.filter, size: 20.w, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      Icon(IconlyLight.search, size: 20.w, color: Colors.white),
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
              child: TabBarView(
                children: [
                  ...notifier.category.map((e) {
                    return SubCategoryView(categoryId: e['Id']);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
