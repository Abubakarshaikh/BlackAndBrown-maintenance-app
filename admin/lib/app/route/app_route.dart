import 'package:admin/filter/filter.dart';
import 'package:admin/signin/signin.dart';
import 'package:admin/work_order/work_order.dart';
import 'package:admin/work_order_details/view/work_order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:admin/app/models/models.dart';

List<Page> onGenerateAppViewPages(String state, List<Page<dynamic>> pages) {
  switch (state) {
    case PageState.authenticated:
      return [
        WorkOrderPage.page(),
      ];
    case PageState.filtered:
      return [
        WorkOrderPage.page(),
        FilterPage.page(),
      ];
    case PageState.detailed:
      return [
        WorkOrderPage.page(),
        WorkOrderDetailsPage.page(),
      ];
    case PageState.unAuthenticated:
      return [SigninPage.page()];
    default:
      return [SigninPage.page()];
  }
}
