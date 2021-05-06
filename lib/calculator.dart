import 'package:flutter/material.dart';

int fbmr = 0;
int fbmr2 = 0;
String text = 'Not calculated yet';
double calculateBMR(gender, weight, height, age) {
  if (gender == 0) {
    return 66 + (6.3 * weight) + (12.9 * height) - (6.8 * age);
  } else {
    return 655 + (4.3 * weight) + (4.7 * height) - (4.7 * age);
  }
}

double calculateFBMR(bmr, fitness) {
  if (fitness == 1) {
    return bmr * 1.2;
  } else if (fitness == 2) {
    return bmr * 1.375;
  } else if (fitness == 3) {
    return bmr * 1.55;
  } else if (fitness == 4) {
    return bmr * 1.725;
  } else {
    return bmr * 1.9;
  }
}
int calculateFitness(daysActive) {
  if (daysActive <= 1) {
    return 1;
  } else if (daysActive <= 3) {
    return 2;
  } else if (daysActive <= 5) {
    return 3;
  } else if (daysActive == 6) {
    return 4;
  } else {
    return 5;
  }
}
int getFBMR (List lst) {
  var sgender = lst[4];
  var gender = int.parse(sgender);
  var sweight = lst[2];
  var weight = int.parse(sweight);
  var sheight = lst[1];
  var height = int.parse(sheight);
  var sage = lst[0];
  var age = int.parse(sage);
  var bmr = calculateBMR(gender, weight, height, age);
  var sdaysActive = lst[3];
  var daysActive = int.parse(sdaysActive);
  var fitness = calculateFitness(daysActive);
  @override
  int fbmr = calculateFBMR(bmr, fitness).round();
  fbmr2 = fbmr;
  lst[5] = fbmr;
  print('Your daily calorie need is ${fbmr.round()} calories.');
  return fbmr;
}