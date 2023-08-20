import 'dart:async';

import 'package:accreditation_management_system/repository/models/post_user_request_model.dart';
import 'package:accreditation_management_system/repository/models/put_engineer_request_model.dart';
import 'package:accreditation_management_system/repository/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/models/login_response_model.dart';
import '../../../repository/user_repository.dart';

part 'engineer_event.dart';

part 'engineer_state.dart';

class EngineerBloc extends Bloc<EngineerEvent, EngineerState> {
  final IUserRepository engineerRepository;

  EngineerBloc({required this.engineerRepository}) : super(EngineerDetailInitial()) {
    on<EngineerDetailFetch>((event, emit) async {
      emit(EngineerDetailLoading());
      try {
        final engineer = engineerRepository.getUser(event.id);
        return engineer.then((value) => emit(EngineerDetailSuccess(engineer: value)));
      } catch (e) {
        emit(EngineerDetailFailure(message: e.toString()));
      }
    });

    on<EngineerDelete>((event, emit) async {
      emit(EngineerDeleteLoading());
      try {
        final engineer = engineerRepository.deleteUser(event.id.toString());
        return engineer.then((value) => emit(EngineerDeleteSuccess(message: value)));
      } catch (e) {
        emit(EngineerDeleteFailure(message: e.toString()));
      }
    });
    on<EngineerListFetch>((event, emit) async {
      emit(EngineerListLoading());
      try {
        final engineers = await engineerRepository.getUsers(0, 100);
        emit(EngineerListSuccess(engineers: engineers));
      } catch (e) {
        emit(EngineerListFailure(message: e.toString()));
      }
    });
    on<EngineerEditButtonPressed>((event, emit) async {
      emit(EngineerEditLoading());
      try {
        final engineer = engineerRepository.putUser(event.engineer);
        return engineer.then((value) => emit(EngineerEditSuccess(engineer: value)));
      } catch (e) {
        emit(EngineerEditFailure(message: e.toString()));
      }
    });
    on<EngineerAddButtonPressed>((event, emit) async {
      emit(EngineerAddLoading());
      try {
        final response = await engineerRepository.createUser(event.engineer);
        emit(EngineerAddSuccess(registerResponseModel: response));
      } catch (e) {
        emit(EngineerAddFailure(message: e.toString()));
      }
    });
  }
}
