part of 'mip_bloc.dart';

abstract class MipEvent extends Equatable {
  const MipEvent();
}

class MipCreateButtonPressed extends MipEvent {
  late PostMIPRequestModel postMIPRequestModel;

  @override
  List<Object> get props => [postMIPRequestModel];
}
