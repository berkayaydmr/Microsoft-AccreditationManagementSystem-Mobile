part of 'mip_bloc.dart';

abstract class MipEvent extends Equatable {
  const MipEvent();
}

class MipCreateButtonPressed extends MipEvent {
  late PostMIPRequestModel postMIPRequestModel;

  @override
  List<Object> get props => [postMIPRequestModel];
}

class MipDetailFetch extends MipEvent {
  late int mipID;

  MipDetailFetch({required this.mipID});

  @override
  List<Object> get props => [mipID];
}

class MipFetchAll extends MipEvent {
  @override
  List<Object> get props => [];
}
