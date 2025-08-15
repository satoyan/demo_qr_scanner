abstract class NavigationService {
  Future<T?>? toNamed<T>(String pageName, {dynamic arguments});
  void back<T>({T? result});
  Future<T?>? offNamed<T>(String pageName, {dynamic arguments});
  Future<T?>? offAllNamed<T>(String pageName, {dynamic arguments});
}

