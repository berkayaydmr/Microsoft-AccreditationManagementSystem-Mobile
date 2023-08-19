part of 'engineer_bloc.dart';

abstract class EngineerEvent extends Equatable {
  const EngineerEvent();
}

class EngineerListFetch extends EngineerEvent {
  @override
  List<Object> get props => [];
}

class EngineerDetailFetch extends EngineerEvent {
  final int id;

  EngineerDetailFetch({required this.id});

  @override
  List<Object> get props => [id];
}

class EngineerDelete extends EngineerEvent {
  final int id;

  EngineerDelete({required this.id});

  @override
  List<Object> get props => [id];
}

class EngineerEditButtonPressed extends EngineerEvent {
  final PutEngineerRequestModel engineer;

  EngineerEditButtonPressed({required this.engineer});

  @override
  List<Object> get props => [engineer];
}

class EngineerAddButtonPressed extends EngineerEvent {
  final PostUserRequestModel engineer;

  const EngineerAddButtonPressed({required this.engineer});

  @override
  List<Object> get props => [engineer];
}
