import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImagePickerFormField extends FormField<bool> {
  ImagePickerFormField({
    super.key,
    super.onSaved,
    super.validator,
    bool initialValue = false,
  }) : super(
         initialValue: initialValue,
         builder: (FormFieldState<bool> state) {
           return _ImagePickerFormFieldContent(state: state);
         },
       );
}

class _ImagePickerFormFieldContent extends StatefulWidget {
  final FormFieldState<bool> state;

  const _ImagePickerFormFieldContent({required this.state});

  @override
  State<_ImagePickerFormFieldContent> createState() =>
      _ImagePickerFormFieldContentState();
}

class _ImagePickerFormFieldContentState
    extends State<_ImagePickerFormFieldContent> {
  Uint8List? imagenBytes;
  String? rutaImagen;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.state.didChange(imagenBytes != null || rutaImagen != null);
    });
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: double.infinity),
      builder: (BuildContext modalContext) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Borrar'),
              onTap: () {
                setState(() {
                  imagenBytes = null;
                  rutaImagen = null;
                  widget.state.didChange(false);
                });
                Navigator.pop(modalContext);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.lightBlueAccent),
              title: Text('Cambiar Foto'),
              onTap: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                );

                if (!mounted || !modalContext.mounted) return;

                if (result != null && result.files.isNotEmpty) {
                  setState(() {
                    if (kIsWeb) {
                      imagenBytes = result.files.first.bytes;
                      rutaImagen = null;
                    } else {
                      rutaImagen = result.files.first.path;
                      imagenBytes = null;
                    }
                    widget.state.didChange(true);
                  });
                }
                if (Navigator.canPop(modalContext)) {
                  Navigator.pop(modalContext);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imagenBytes != null || rutaImagen != null)
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
            child: GestureDetector(
              onTap: () => _showImageOptions(context),
              child:
                  kIsWeb
                      ? Image.memory(imagenBytes!, fit: BoxFit.contain)
                      : Image.file(File(rutaImagen!), fit: BoxFit.contain),
            ),
          )
        else
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.image,
              );

              if (!mounted) return;

              if (result != null && result.files.isNotEmpty) {
                setState(() {
                  if (kIsWeb) {
                    imagenBytes = result.files.first.bytes;
                    rutaImagen = null;
                  } else {
                    rutaImagen = result.files.first.path;
                    imagenBytes = null;
                  }
                  widget.state.didChange(true);
                });
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.cloud_upload),
                SizedBox(width: 8),
                Text("Subir Evidencia"),
              ],
            ),
          ),
        if (widget.state.hasError)
          Text(widget.state.errorText!, style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
