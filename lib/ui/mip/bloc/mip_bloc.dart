import 'dart:async';

import 'package:accreditation_management_system/repository/models/mip.dart';
import 'package:accreditation_management_system/repository/models/post_mip_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/mip_repository.dart';

part 'mip_event.dart';
part 'mip_state.dart';

class MipBloc extends Bloc<MipEvent, MipState> {
  late IMipRepository mipRepository;

  MipBloc({required this.mipRepository}) : super(MipInitial()) {
    on<MipDetailFetch>((event, emit) async {
      emit(MipDetailFetchLoading());
      try {
        var mip = await mipRepository.getMip(event.mipID);
        emit(MipDetailFetchSuccess(mip: mip));
      } catch (e) {
        emit(MipDetailFetchFailure(message: e.toString()));
      }
    });
    on<MipFetchAll>((event, emit) async {
      emit(MipDetailFetchLoading());
      try {
        var mipList = await mipRepository.getAll();
        emit(MipFetchAllSuccess(mipList: mipList));
      } catch (e) {
        emit(MipFetchAllFailure(message: e.toString()));
      }
    });
  }
}
