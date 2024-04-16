

import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';

import '../../models/join_team_jobs.dart';
import '../../models/params/join_team_params.dart';

class JoinTeamRepo {
  static Future<Either<String, JoinOurTeamJobs>> getJoinOurTeamJobs() {
    return BaseApiClient.get<JoinOurTeamJobs>(
        url: ApiConst.getJoinOurTeamJobs,
        converter: (e) {
          return JoinOurTeamJobs.fromJson(e);
        });
  }

  static Future<Either<String, String>> addJoinOurTeamJobs(
      {required JoinTeamParams joinParams}) async {
    return BaseApiClient.post<String>(
        url: ApiConst.addJoinOurTeamJobs,
        formData: {
          "name": joinParams.name,
          "phone": joinParams.phone,
          "job": joinParams.job
        },
        converter: (e) {
          return "";
        });
  }
}
