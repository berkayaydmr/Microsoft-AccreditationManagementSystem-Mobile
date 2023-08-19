part of 'mip_bloc.dart';

abstract class MipState extends Equatable {
  const MipState();
}

class MipInitial extends MipState {
  @override
  List<Object> get props => [];
}

class MipCreateSuccess extends MipState {
  late String message;

  @override
  List<Object> get props => [];
}

class MipCreateFailure extends MipState {
  late String message;

  @override
  List<Object> get props => [];
}

class MipCreateLoading extends MipState {
  @override
  List<Object> get props => [];
}
