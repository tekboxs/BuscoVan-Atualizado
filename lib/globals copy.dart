library globals;

import 'dart:async';

import 'package:flutter/material.dart';

String loginInput = "";
String userNamePreview = "";
int userRegionId = -1;
int userId = -1;

//SECTION Errors indicators
String errorIndicator = '';
String errorMessage = '?';
dynamic errorClass;
//!SECTION

bool isDelivery = false;

int deliveryAnimationCount = 0;
double currentCartTotal = 0.0;
int paymentMethodId = 3;

String currentCategoryName = 'Todos';
int currentCategoryId = -1; //mean flag all
bool isGroup = false;

double totalPrice = 0.0;

String currentInvoiceGuid = "";

Map currentInvoiceDetails = {};

String currentHistoryGuid = '';
int currentHistoryId = -1;

ScrollController scrollController = ScrollController();
double currentOffset = 0;

void timer(void Function() callback) async {
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (timer.tick % 10 == 0) {
      // debugPrint(">>Check for notfication");

      // await NotificationClient.fetch();
    }
  });
}

bool setFocus = true;

int currentProductId = -1;
String currentProductName = "";
double currentInitialValueFactor = 0.0;
int requestAttemp = 0;
double currentConvertFactor = -1.0;
