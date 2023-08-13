part of 'engineer_bloc.dart';

abstract class EngineerState extends Equatable {
  const EngineerState();
}

class EngineerDetailInitial extends EngineerState {
  @override
  List<Object> get props => [];
}

class EngineerDetailLoading extends EngineerState {
  @override
  List<Object> get props => [];
}

class EngineerDetailSuccess extends EngineerState {
  final EngineerResponseModel engineer;

  EngineerDetailSuccess({required this.engineer});

  @override
  List<Object> get props => [engineer];
}

class EngineerDetailFailure extends EngineerState {
  final String message;

  EngineerDetailFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class EngineerDeleteSuccess extends EngineerState {
  final String message;

  EngineerDeleteSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class EngineerDeleteFailure extends EngineerState {
  final String message;

  EngineerDeleteFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class EngineerDeleteLoading extends EngineerState {
  @override
  List<Object> get props => [];
}

class EngineerListLoading extends EngineerState {
  @override
  List<Object> get props => [];
}

class EngineerListSuccess extends EngineerState {
  final List<EngineerResponseModel> engineers;

  EngineerListSuccess({required this.engineers});

  @override
  List<Object> get props => [engineers];
}

class EngineerListFailure extends EngineerState {
  final String message;

  EngineerListFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class EngineerEditLoading extends EngineerState {
  @override
  List<Object> get props => [];
}

class EngineerEditSuccess extends EngineerState {
  final EngineerResponseModel engineer;

  EngineerEditSuccess({required this.engineer});

  @override
  List<Object> get props => [engineer];
}

class EngineerEditFailure extends EngineerState {
  final String message;

  EngineerEditFailure({required this.message});

  @override
  List<Object> get props => [message];
}
