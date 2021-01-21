/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/utils/web_utils/web_utils.dart';

import '../services.dart';

class AppAnalytics {
  final _log = AppLog('AppAnalytics');

  // final FirebaseAnalytics _service = FirebaseAnalytics();
  bool enabled = false;

  void init() {
    if (GetPlatform.isAndroid) {
      enabled = true;
    } else {
      enabled = !GetPlatform.isDesktop && !WebUtils.isSimulator;
    }
    if (enabled) {
      // _service.logAppOpen();
    }
  }

  // List<FirebaseAnalyticsObserver> getObservers() {
  //   if (!enabled) return [];
  //   return [FirebaseAnalyticsObserver(analytics: _service)];
  // }

  void sendScreen(String name) {
    if (!enabled) return;
    _log('analytics send screen: $name');
    // _service.setCurrentScreen(screenName: name);
  }

  void sendLogEvent(
    String name,
    Map<String, dynamic> params,
  ) {
    if (!enabled) return;
    _log('sendLogEvent( $name, $params)');
    // _service.logEvent(name: name, parameters: params);
  }

  void tapCoupon(String id) {
    sendLogEvent('tap_coupon', {'id': id});
  }

  void selectHomeCategory(String categoryName) {
    sendLogEvent('select_home_category', {'name': categoryName});
  }

  void selectHomeCompany(String companyName, String companyId) {
    sendLogEvent('select_home_company', {'name': companyName, 'id': companyId});
  }

  void selectHomeSubcategory(String categoryName) {
    sendLogEvent('select_home_subcategory', {'name': categoryName});
  }

  void tapConditions(String campaignId) {
    sendLogEvent('tap_conditions', {'campaign_id': campaignId});
  }

  void subcribeDailyNotifications(bool flag) {
    sendLogEvent('fcm_daily_topic', {'status': flag});
  }

  // void updateUser(UserModel user) {
  //   if (!enabled) return;
  //   _service.setUserId(user.id);
  //   _service.setUserProperty(name: 'name', value: user?.fullnameUI);
  //   _service.setUserProperty(name: 'email', value: user?.email);
  // }

  void signup() {
    if (!enabled) return;
    _log('signup()');
    // _service.logSignUp(signUpMethod: 'form');
  }

  void login() {
    if (!enabled) return;
    _log('login()');
    // _service.logLogin(loginMethod: 'form');
  }

  List<NavigatorObserver> getObservers() {
    if (!enabled) return [];
    // return [FirebaseAnalyticsObserver(analytics: _service)];
    return [];
  }
}
