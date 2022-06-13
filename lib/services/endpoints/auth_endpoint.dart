import '../endpoints.dart';

const String var1 = "{var1}";
const String var2 = "{var2}";
const String var3 = "{var3}";

class AuthEndpoints {
  AuthEndpoints._();

  static get listOfCoins => AuthEndpoint("/v1/coins", Method.get);

}
