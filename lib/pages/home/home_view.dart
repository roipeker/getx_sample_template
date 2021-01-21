import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final bgColor = Get.theme.scaffoldBackgroundColor;
    return Scaffold(
      body: Center(
        child: Text("HOME"),
      ),
    );
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: CustomScrollView(
//               controller: controller.mainScrollController,
//               slivers: [
//                 SliverAppBar(
//                   backgroundColor: bgColor,
//                   stretch: true,
//                   flexibleSpace: FlexibleSpaceBar(
// //                      background: Slideshow(offset: 60.0),
//                     background: Padding(
//                       padding: const EdgeInsets.only(
//                         bottom: kCategoryMenuHeight,
//                       ),
//                       child: HomeBannerWidget(),
//                     ),
//                     collapseMode: CollapseMode.parallax,
//                     stretchModes: [StretchMode.zoomBackground],
//                   ),
//                   toolbarHeight: 0,
//                   expandedHeight: 180 + 50.0,
//                   collapsedHeight: 1,
//                   pinned: true,
//                   floating: true,
//                   bottom: HomeCategoriesMenu.render(bgColor: bgColor),
//                 ),
//                 GetBuilder(
//                   init: controller,
//                   id: 'front',
//                   builder: (_) {
//                     return SliverVisibility(
//                       sliver: HomeFeaturedList()
//                           .paddingOnly(top: 8, left: 12, right: 12)
//                           .sliverBox,
//                       visible: !controller.isLoadingFront &&
//                           controller.featured.isNotEmpty,
//                     );
//                   },
//                 ),
//                 GetBuilder(
//                   init: controller,
//                   id: 'front',
//                   builder: (_) {
//                     final isLoading = controller.isLoadingFront;
//                     if (isLoading) {
//                       return SliverFillRemaining(
//                         child: WidgetFader(
//                           duration: .4.seconds,
//                           child: Center(
//                             child: PreloaderCircular(
//                               bgColor: Styles.primaryColor,
//                               preloaderColor: Colors.white,
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                     if (controller.hasNoData) {
//                       return SliverFillRemaining(
//                         fillOverscroll: true,
//                         child: NoContent(
//                           message: 'Sin datos',
//                         ),
//                       );
//                     }
//                     return SliverVisibility(
//                       visible: controller.companies.isNotEmpty,
//                       sliver: SliverPadding(
//                         padding: EdgeInsets.symmetric(horizontal: 12),
//                         sliver: SliverGrid(
//                           delegate: SliverChildBuilderDelegate(
//                             (ctx, idx) {
//                               var model = controller.companies[idx];
//                               return SizedBox(
//                                 height: 88,
//                                 child: HomeListingItem(
//                                   model: model,
// //                                  fadeDelay: (idx * .2).toDouble().seconds,
//                                   onTap: () => controller.handleItemTap(model),
//                                 ),
//                               );
//                             },
//                             childCount: controller.companies.length,
//                           ),
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 12,
//                             crossAxisSpacing: 15,
//                             childAspectRatio: 160 / 105,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
  }
}
