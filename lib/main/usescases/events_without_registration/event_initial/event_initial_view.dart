import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import '../../general/view_base.dart';

mixin EventInitialView implements ViewBase {
  void setProgram(Program? program);

  void renderError(String message);

  void onEventCreated(String eventUid);

  void onEventUpdated(String eventUid);

  void setProgramStage(ProgramStage? programStage);

  void updatePercentage(double primaryValue);

  void showProgramStageSelection();

  void setAccessDataWrite(bool canWrite);

  void showQR();

  void showEventWasDeleted();
}
