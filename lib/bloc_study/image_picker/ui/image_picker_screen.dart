import 'dart:io';

import 'package:bloc_state_management/bloc_study/image_picker/bloc/bloc/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc_study/image_picker/bloc/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker Bloc")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  return IconButton(
                    onPressed: () {
                      context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                    },
                    icon: Icon(Icons.camera_alt, size: 60),
                  );
                } else {  
                  return Image.file(File(state.file!.path));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
