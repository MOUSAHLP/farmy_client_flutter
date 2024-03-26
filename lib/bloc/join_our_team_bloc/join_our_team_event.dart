import '../../models/params/join_team_params.dart';

abstract class JoinOurTeamEvent {}

class GetJoinOurTeam extends JoinOurTeamEvent {}
class AddJoinOurTeam extends JoinOurTeamEvent {
  JoinTeamParams joinTeamParams;
  AddJoinOurTeam({required this.joinTeamParams});
}
