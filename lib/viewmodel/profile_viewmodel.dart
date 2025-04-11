import 'package:dev_portfolio/data/model/profile.dart';
import 'package:dev_portfolio/data/repository/portfolio_repository.dart';
import 'package:flutter/widgets.dart';

class ProfileViewmodel with ChangeNotifier {
  PortfolioRepository repository = PortfolioRepository();

  Profile _profile = Profile(
    fullName: 'fullName',
    aboutText: 'aboutText',
    role: '',
    links: [],
    experience: [],
    education: [],
  );
  Profile get profile => _profile;

  Future<void> fetchProfile() async {
    var portfolio = await repository.loadPortfolio();
    _profile = portfolio.profile;
    notifyListeners();
  }
}
