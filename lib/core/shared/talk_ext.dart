import '../domain/talk.dart';
import '../infrastructure/conf_data.dart';

// using this to not muddy the domain models with data
// could probs do it a better way
extension TalkExtension on Talk {
  bool get isNow =>
      ConfData.nowInConference.isAfter(start) &&
      ConfData.nowInConference.isBefore(end);
  bool get hasPassed => ConfData.nowInConference.isAfter(end);
}
