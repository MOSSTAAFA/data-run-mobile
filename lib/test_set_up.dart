import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';

final Dio dio = Dio(BaseOptions());
final DioAdapter dioAdapter =
    DioAdapter(dio: dio, matcher: const UrlRequestMatcher());

Future<void> setUpTes() async {
  /// Activity
  final String activitiesJsonString =
  await rootBundle.loadString('lib/sample/dhis/activities.json');
  final Map<String, dynamic> activityDate = json.decode(activitiesJsonString);
  dioAdapter.onGet(
    'https://mis.nmcpye.org/staging/api/activities.json?fields=id,name,lastName,langKey,login,created,lastUpdated,birthday,gender,displayName,jobTitle,surname,employer,email,firstName,phoneNumber,nationality,code,lastLogin,username,userRoles[id,name,code],organisationUnits[id,code,name],teams[id,name],dataViewOrganisationUnits[id,code,name],userGroups[id,name],authorities,programs,dataSets',
        (server) => server.reply(200, activityDate),
  );

  /// user
  final String userJsonString =
      await rootBundle.loadString('lib/sample/dhis/me.json');
  final Map<String, dynamic> userDate = json.decode(userJsonString);
  dioAdapter.onGet(
    'https://play.dhis2.org/2.35.11/api/me.json?fields=id,name,lastName,langKey,login,created,lastUpdated,birthday,gender,displayName,jobTitle,surname,employer,email,firstName,phoneNumber,nationality,code,lastLogin,username,userRoles[id,name,code],organisationUnits[id,code,name],teams[id,name],dataViewOrganisationUnits[id,code,name],userGroups[id,name],authorities,programs,dataSets',
    (server) => server.reply(200, userDate),
  );

  /// organisationUnits
  final String orgUnitsJsonString =
      await rootBundle.loadString('lib/sample/dhis/orgUnits.json');
  final Map<String, dynamic> organisationUnits =
      json.decode(orgUnitsJsonString);

  dioAdapter.onGet(
    'https://play.dhis2.org/2.35.11/api/organisationUnits.json?filter=path:ilike:ZpE2POxvl9P&filter=path:ilike:EJoI3HArJ2W&filter=path:ilike:xt08cuqf1ys&filter=path:ilike:dGheVylzol6&filter=path:ilike:vELbGdEphPd&filter=path:ilike:Wr8kmywwseZ&filter=path:ilike:azRICFoILuh&filter=path:ilike:O6uvpzGd5pu&filter=path:ilike:pMEnu7BjqMz&filter=path:ilike:duGLGssecoD&filter=path:ilike:bG0PlyD0iP3&filter=path:ilike:OI0BQUurVFS&filter=path:ilike:C1zlHePEQe6&filter=path:ilike:dqHvtpUqLwB&filter=path:ilike:YuQRtpLP10I&filter=path:ilike:OuwX8H2CcRO&filter=path:ilike:GQcsUZf81vP&filter=path:ilike:KvE0PYQzXMM&filter=path:ilike:DiszpKrYNg8&filter=path:ilike:egv5Es0QlQP&filter=path:ilike:XzmWizbR343&filter=path:ilike:g8upMTyEZGZ&filter=path:ilike:mepHuAA9l51&filter=path:ilike:aQoqXL4cZaF&filter=path:ilike:YWXXO0XMkQe&filter=path:ilike:mt47bcb0Rcj&filter=path:ilike:KKkLOTpMXGV&filter=path:ilike:CvBAqD6RzLZ&filter=path:ilike:RzgSFJ9E46G&filter=path:ilike:wNYYRm2c9EK&filter=path:ilike:PybxeRWVSrI&filter=path:ilike:cJkZLwhL8RP&filter=path:ilike:am6EFqHGKeU&filter=path:ilike:Dbn6fyCgMBV&filter=path:ilike:EuoA3Crpqts&filter=path:ilike:LZclRdyVk1t&filter=path:ilike:cgqkFdShPzg&filter=path:ilike:E7IDb3nNiW7&filter=path:ilike:RTixJpRqS4C&filter=path:ilike:gP6hn503KUX&filter=path:ilike:p9ZtyC3LQ9f&filter=path:ilike:TSyzvBiovKh&filter=path:ilike:AXZq6q7Dr6E&filter=path:ilike:fA43H8Ds0Ja&filter=path:ilike:zFDYIgyGmXG&filter=path:ilike:fdc6uOvgoji&filter=path:ilike:OjTS752GbZE&filter=path:ilike:ZxuSbAmsLCn&filter=path:ilike:wwM3YPvBKu2&filter=path:ilike:Umh4HKqqFp6&filter=path:ilike:ctMepV9p92I&filter=path:ilike:vWbkYPRmKyS&filter=path:ilike:prNiMdHuaaU&filter=path:ilike:Tht0fnjagHi&filter=path:ilike:BGGmAwx33dj&filter=path:ilike:wzvDhS0TkAF&filter=path:ilike:E497Rk80ivZ&filter=path:ilike:nX05QLraDhO&filter=path:ilike:EFTcruJcNmZ&filter=path:ilike:kEkU53NrFmy&filter=path:ilike:WAjjFMDJKcx&filter=path:ilike:KfUCAQoOIae&filter=path:ilike:tZxqVn3xNrA&filter=path:ilike:uNEhNuBUr0i&filter=path:ilike:CTOMXJg41hz&filter=path:ilike:jNb63DIHuwU&filter=path:ilike:AnXoUM1tfNT&filter=path:ilike:fwH9ipvXde9&filter=path:ilike:kRWIof0qPJj&filter=path:ilike:y5hLlID8ihI&rootJunction=OR&fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,level,path,externalAccess,openingDate,geometry,parent,ancestors[id,name,displayName,level,path,openingDate],closedDate,programs&paging=false',
    (MockServer server) => server.reply(200, organisationUnits),
  );

  /// organisationUnitLevels
  final String orgUnitLevelsJsonString =
      await rootBundle.loadString('lib/sample/dhis/orgUnitLevels.json');
  final Map<String, dynamic> organisationUnitLevels =
      json.decode(orgUnitLevelsJsonString);

  dioAdapter.onGet(
    'https://play.dhis2.org/2.35.11/api/organisationUnitLevels.json?fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,level,offlineLevels&paging=false',
    (MockServer server) => server.reply(200, organisationUnitLevels),
  );
}
