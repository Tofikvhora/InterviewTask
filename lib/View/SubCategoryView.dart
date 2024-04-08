import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Provider/DataProvider.dart';

class SubCategoryView extends HookWidget {
  final int categoryId;

  const SubCategoryView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<DataProvider>(context, listen: true);

    useEffect(() {
      Future.microtask(() {
        notifier.loadSubCategory(categoryId: categoryId);
      });
      return () {};
    }, [categoryId]);
    return ListView.builder(
      itemCount: notifier.subCategory.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final item = notifier.subCategory[index];
        return SizedBox(
          height: 240,
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  item['Name'],
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item['Product'].length,
                  itemBuilder: (context, index) {
                    final singleProduct = item['Product'][index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Image.network(
                              singleProduct['ImageName'],
                              width: 120.w,
                              height: 120.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            singleProduct['Name'],
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
