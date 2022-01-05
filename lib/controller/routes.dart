import 'package:flutter/material.dart';
import 'package:flutter_api/view/categories.dart';

final Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  Categories.route: (context) => const Categories(),
};
