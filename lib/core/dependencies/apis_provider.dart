import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/api/api_utils.dart';

final clientProvider = Provider((ref) => Dio());

final reqResApiProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider),
    host: 'reqres.in',
    tokenAuthorization: '',
  ),
);
