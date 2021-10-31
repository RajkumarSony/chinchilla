//import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//import 'package:customer_app/services/remote_config.dart';
import 'package:customer_app/utils/constants/apiSecrets.dart';

class GraphQLService {
  // RemoteConfigService _remoteConfigService = Get.find();
  late ValueNotifier<GraphQLClient> client;
  void setupGraphQL() async {
    await initHiveForFlutter();
    //final String kGraphQLProdUrl = '${_remoteConfigService.prodUrl}api';
    final HttpLink httpLink = HttpLink(kGraphQLApiUrl);
    client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    debugPrint('GraphQL Initialised');
  }
}
