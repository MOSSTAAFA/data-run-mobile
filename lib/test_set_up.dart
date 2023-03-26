import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';

final Dio dio = Dio(BaseOptions());
final DioAdapter dioAdapter =
    DioAdapter(dio: dio, matcher: const UrlRequestMatcher());

Future<void> setUpTes() async {

  /// organisationUnits
  final String orgUnitsJsonString =
      await rootBundle.loadString('lib/sample/dhis/orgUnits.json');
  final Map<String, dynamic> organisationUnits =
      json.decode(orgUnitsJsonString);

  dioAdapter.onGet(
    'https://play.dhis2.org/2.35.11/api/organisationUnits.json?filter=path:ilike:ImspTQPwCqd&rootJunction=OR&fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,level,path,externalAccess,openingDate,geometry,parent,ancestors[id,name,displayName,level,path,openingDate]&paging=false',
    (MockServer server) => server.reply(200, organisationUnits),
  );

  /// organisationUnitLevels
  final String orgUnitLevelsJsonString =
  await rootBundle.loadString('lib/sample/dhis/orgUnitLevels.json');
  final Map<String, dynamic> organisationUnitLevels =
  json.decode(orgUnitLevelsJsonString);

  dioAdapter.onGet(
    'https://play.dhis2.org/2.35.11/api/organisationUnitLevels.json',
    (MockServer server) => server.reply(200, organisationUnitLevels),
  );
}
