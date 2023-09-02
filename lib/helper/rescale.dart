import 'package:flutter/material.dart';

//This function helps to calculate the size
double rescale(BuildContext context, double value) {
  return (MediaQuery.of(context).size.width / 375) * value;
}
