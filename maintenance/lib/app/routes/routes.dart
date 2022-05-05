import 'package:flutter/widgets.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/app/models/app_status.dart';
import 'package:maintenance/app/models/models.dart';
import 'package:maintenance/cm/view/cm_page.dart';
import 'package:maintenance/hcl/view/view.dart';
import 'package:maintenance/home/view/home_page.dart';
import 'package:maintenance/pm/pm.dart';
import 'package:maintenance/sign_up/sign_up.dart';
import 'package:maintenance/signin/signin.dart';
import 'package:maintenance/submit/submit.dart';
import 'package:maintenance/submitted/view/submitted_page.dart';

List<Page> onGenerateAppViewPages(String state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.homeCompletedWithCm:
      return [
        HomePage.page(),
        CMPage.page(),
      ];
    case AppStatus.homeCompletedWithPm:
      return [
        HomePage.page(),
        PMPage.page(),
      ];
    case AppStatus.homeCompletedWithHcl:
      return [
        HomePage.page(),
        HclPage.page(),
      ];
    case AppStatus.cmComplete:
      return [
        HomePage.page(),
        CMPage.page(),
        SubmitPage.page(),
      ];
    case AppStatus.hclComplete:
      return [
        HomePage.page(),
        HclPage.page(),
        SubmitPage.page(),
      ];
    case AppStatus.pmComplete:
      return [
        HomePage.page(),
        PMPage.page(),
        SubmitPage.page(),
      ];
    case AppStatus.submitComplete:
      return [
        SubmitPage.page(),
        SubmittedPage.page(),
      ];
    case AppStatus.submittedComplete:
      return [
        App.page(),
      ];
    case AppStatus.register:
      return [
        SigninPage.page(),
        SignUpPage.page(),
      ];
    case AppStatus.authenticated:
      return [
        // WorkOrderPage.page(),
        HomePage.page(),
      ];
    case AppStatus.unauthenticated:
      return [
        SignUpPage.page(),
        SigninPage.page(),
      ];
    default:
      return [
        SigninPage.page(),
      ];
  }
}
