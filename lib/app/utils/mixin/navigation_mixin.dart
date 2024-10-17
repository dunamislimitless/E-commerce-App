import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:flutter/material.dart';

mixin NavigationMixin{
  goToHome(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()))
;}