import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/dependencies/device_provider.dart';
import 'package:foonkie_monkey/core/entities/user.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  File? _localImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.browse_gallery),
                        title: Text('Galeria'),
                        onTap: () {
                          ChangeImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text('Camara'),
                        onTap: () {
                          ChangeImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: ClipOval(
              child: _localImage == null
                  ? SizedBox(
                      height: kDimens150,
                      width: kDimens150,
                      child: Image(
                        image: NetworkImage(widget.user?.avatar ?? ''),
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(
                      height: kDimens150,
                      width: kDimens150,
                      child: Image.file(
                        _localImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          ListTile(
            title: Text('${widget.user?.firstName} ${widget.user?.lastName}'),
            subtitle: Text(widget.user?.email ?? ''),
          )
        ],
      ),
    );
  }

  Future ChangeImage(ImageSource source) async {
    _localImage = await ref.read(pickImageProvider).pickImage(source);
    setState((){});
  }
}
