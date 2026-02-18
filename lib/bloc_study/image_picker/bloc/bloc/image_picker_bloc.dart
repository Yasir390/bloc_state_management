import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc_study/image_picker/bloc/bloc/image_picker_state.dart';
import 'package:bloc_state_management/bloc_study/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';

part 'image_picker_event.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc({required this.imagePickerUtils})
    : super(ImagePickerState()) {
    on<CameraCaptureEvent>(_cameraCapture);
  }

  Future<void> _cameraCapture(
    CameraCaptureEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
