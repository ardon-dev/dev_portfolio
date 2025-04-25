import 'dart:convert';
import 'package:dev_portfolio/data/model/portfolio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class PortfolioRepository {
  Future<Portfolio> loadPortfolio() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/portfolio.json',
    );
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return Portfolio.fromJson(jsonData);
  }

  Future<Portfolio?> fetchPortfolioFromWeb() async {
    final response = await http.get(
      Uri.parse(
        'https://raw.githubusercontent.com/ardon-dev/dev_portfolio/refs/heads/main/assets/data/portfolio.json',
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      Portfolio portfolio = Portfolio.fromJson(decodedJson);
      return portfolio;
    } else {
      return null;
    }
  }
}
