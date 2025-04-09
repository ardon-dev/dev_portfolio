import 'dart:convert';
import 'package:dev_portfolio/data/model/portfolio.dart';
import 'package:flutter/services.dart';

class ProfileRepository {
  Future<Portfolio> loadPortfolio() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/portfolio.json',
    );
    print(jsonString);
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    print(jsonData);
    return Portfolio.fromJson(jsonData);
  }
}
