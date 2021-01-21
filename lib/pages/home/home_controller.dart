/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/root/base_tab_controller.dart';
import 'package:getx_app_template/pages/root/models/nav_data.dart';
import 'home_repo.dart';

class HomeController extends BaseTabController {
  static HomeController get() => Get.find();

  @override
  final int navId = NavKeys.HOME;

  final _repo = HomeRepo.get();
  final switcher = false.obs;
  bool isLoadingFront = false;

  final bannerPageController = PageController();
  final mainScrollController = ScrollController();
  // int get bannersTotal => _repo.bannerMenu.length;
  // bool get hasNoData => featured.isEmpty && companies.isEmpty;
  // HomeBannerModel getBanner(int idx) => _repo.bannerMenu[idx];
  // void selectBanner(int idx) {
  //   _repo.loadSubcategory(idx);
  //   update(['front']);
  // }
  // int get featuredTotal => _repo.featured.length;
  // HomeModelCompany getFeaturedModel(int idx) {
  //   return _repo.featured[idx];
  // }

  @override
  Future<void> onReady() async {
    // _repo.refreshFavs();
//    _repo.updateProviders();
//     _loadCategories();
//     _loadFront();
  }

  @override
  void onClose() {
    super.onClose();
    mainScrollController?.dispose();
    bannerPageController?.dispose();
  }

  // List<CategoryVo> get categories {
  //   return _repo.categories;
  // }

  /// EXTENRAL from MapController.
//   void handleMapItemTap(HomeModelCompany model) {
//     if (GetInstance().isRegistered<StoreController>()) {
//     } else {
//       _repo.openStore(model.dto);
//       Get.to(
//         StoreView(),
//         id: navId,
//         binding: BindingsBuilder(() {
//           Get.put(StoreController(navId: navId, company: model));
//         }),
//         duration: 0.seconds,
//         transition: Transition.noTransition,
//       );
//     }
//   }
//
//   void handleItemTap(HomeModelCompany model) {
//     _repo.openStore(model.dto);
//     Get.to(
//       StoreView(),
//       id: navId,
//       binding: BindingsBuilder(() {
//         Get.put(StoreController(navId: navId, company: model));
//       }),
//       duration: .3.seconds,
//       transition: Transition.native,
//     );
//   }
//
//   Future<void> _loadCategories() async {
//     currentCategory = categories?.first;
//     await _repo.loadCategories();
//     currentCategory = categories?.first;
//     update(['categories']);
//   }
//
//   Future<void> _loadFront() async {
//     if (!isLoadingFront) {
//       isLoadingFront = true;
//       update(['front', 'banner']);
//     }
//     _resetBanner();
//     final success = await _repo.loadFront(category: currentCategory.id);
//     if (!success) return;
//     isLoadingFront = false;
//
//     update(['front', 'banner']);
//   }
//
//   void _resetBanner() {
//     if (!bannerPageController.hasClients) return;
//     if (bannerPageController.page != 0.0) {
//       bannerPageController.animateToPage(
//         0,
//         duration: .3.seconds,
//         curve: Curves.easeOutExpo,
//       );
//     }
// //    bannerPageController.jumpToPage(0);
//   }
//
//   List<HomeModelCompany> get featured {
//     return _repo.featured;
//   }
//
//   List<HomeModelCompany> get companies {
//     return _repo.companies;
//   }
//
//   Future<void> selectCategory(CategoryVo model) async {
//     if (currentCategory == model) return;
//     currentCategory = model;
//     FirebaseService.analytics.selectHomeCategory(model.name);
//     update(['categories']);
//     _loadFront();
//   }

  bool canPop() {
    // if (GetInstance().isRegistered<StoreController>()) {
    //   return Get.find<StoreController>().canPop();
    // } else {}
    return false;
  }

  @override
  void onTabOpen() {
    Styles.statusIconsB();
  }
}
