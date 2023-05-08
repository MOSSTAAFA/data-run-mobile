import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

final Dio activityManagementDio = Dio(BaseOptions());
final DioAdapter activityManagementDioAdapter =
    DioAdapter(dio: activityManagementDio, matcher: const UrlRequestMatcher());

const List<String> activityManagementEntitiesNames = [
  'projects',
  'activities',
  'assignments',
  'teams'
];

Future<void> setUpActivityManagementMocks() async {
  /// Activity
  final String activitiesJsonString =
      await rootBundle.loadString('lib/sample/dhis/activities.json');
  final Map<String, dynamic> activityDate = json.decode(activitiesJsonString);
  activityManagementDioAdapter.onGet(
    'https://mis.nmcpye.org/staging/api/activities.json?fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,project,startDate,endDate,inactive,assignments[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,team,organisationUnit,startDate,status,targetSource,startPeriod,period,periodType],teams[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,teamGroup,assignments[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,team,organisationUnit,startDate,status,targetSource,startPeriod,period,periodType],inactive,synced],programs,organisationUnits&paging=false',
    (server) => server.reply(200, activityDate),
  );

  /// Project
  final String projectJsonString =
      await rootBundle.loadString('lib/sample/dhis/projects.json');
  final Map<String, dynamic> projectsData = json.decode(projectJsonString);
  activityManagementDioAdapter.onGet(
    'https://mis.nmcpye.org/staging/api/projects.json?fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,activities[id,dirty,lastUpdated,created,name,displayName,shortName,code,project,startDate,endDate,inactive,assignments[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,team,organisationUnit,startDate,status,targetSource,startPeriod,period,periodType],teams[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,teamGroup,assignments[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,team,organisationUnit,startDate,status,targetSource,startPeriod,period,periodType],inactive,synced],programs,organisationUnits]&paging=false',
    (server) => server.reply(200, projectsData),
  );

  /// assignments
  final String assignmentJsonString =
      await rootBundle.loadString('lib/sample/dhis/assignments.json');
  final Map<String, dynamic> assignmentData = json.decode(assignmentJsonString);
  activityManagementDioAdapter.onGet(
    'https://mis.nmcpye.org/staging/api/assignments.json?fields=id,name,lastName,langKey,login,created,lastUpdated,birthday,gender,displayName,jobTitle,surname,employer,email,firstName,phoneNumber,nationality,code,lastLogin,username,userRoles[id,name,code],organisationUnits[id,code,name],teams[id,name],dataViewOrganisationUnits[id,code,name],userGroups[id,name],authorities,programs,dataSets',
    (server) => server.reply(200, assignmentData),
  );

  /// team
  final String teamJsonString =
      await rootBundle.loadString('lib/sample/dhis/teams.json');
  final Map<String, dynamic> teamData = json.decode(teamJsonString);
  activityManagementDioAdapter.onGet(
    'https://mis.nmcpye.org/staging/api/teams.json?filter=id:in:[]&fields=id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,teamGroup,assignments[id,dirty,lastUpdated,created,name,displayName,shortName,code,activity,team,organisationUnit,startDate,status,targetSource,startPeriod,period,periodType],inactive,synced&paging=false',
    (server) => server.reply(200, teamData),
  );
}
