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

class MipDetailFetchLoading extends MipState {
  @override
  List<Object> get props => [];
}

class MipDetailFetchSuccess extends MipState {
  late Mip mip;

  MipDetailFetchSuccess({required this.mip});

  @override
  List<Object> get props => [mip];
}

class MipDetailFetchFailure extends MipState {
  late String message;

  MipDetailFetchFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class MipFetchAllSuccess extends MipState {
  late List<Mip> mipList;

  MipFetchAllSuccess({required this.mipList});

  @override
  List<Object> get props => [mipList];
}

class MipFetchAllFailure extends MipState {
  late String message;

  MipFetchAllFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class MipFetchAllLoading extends MipState {
  @override
  List<Object> get props => [];
}
