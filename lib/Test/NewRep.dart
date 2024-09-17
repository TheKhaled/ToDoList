import 'package:dio/dio.dart';

class GetAPiLink {
  final dio = Dio();

  Future getHttp() async {
    final response = await dio.get(
      "https://art-ecommerce-server.glitch.me/api/orders",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token", // Replace "token" with your actual token
        },
      ),
    );

    print("the response is ${response}");
  }
}
// 9a07e7374013472fa47e71dc7d389b6e