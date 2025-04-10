import 'dart:convert';
import 'package:dev_portfolio/data/model/portfolio.dart';
import 'package:flutter/services.dart';

class PortfolioRepository {
  Future<Portfolio> loadPortfolio() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/portfolio.json',
    );
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return Portfolio.fromJson(jsonData);
  }
}
