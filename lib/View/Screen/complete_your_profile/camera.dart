import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';



class UploadCard extends StatefulWidget {
  const UploadCard({Key? key}) : super(key: key);

  @override
  _UploadCardState createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  OverlayFormat format = OverlayFormat.cardID3;
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog on outside tap
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text(
                'Uploading...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

          backgroundColor: Colors.white,
          body: FutureBuilder<List<CameraDescription>?>(
            future: availableCameras(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No camera found',
                        style: TextStyle(color: Colors.black),
                      ));
                }
                return CameraOverlay(
                    snapshot.data!.first,
                    CardOverlay.byFormat(format),
                        (XFile file) => showDialog(
                      context: context,
                      barrierColor: Colors.black,
                      builder: (context) {
                        CardOverlay overlay = CardOverlay.byFormat(format);
                        return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            backgroundColor: Colors.black,
                            title: const Text('Capture',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Icon(Icons.close)),
                                  ElevatedButton(
                                    onPressed: () async{
                                     // var userPersonalInfoProvider = context.read<UserPersonalInfoProvider>();
                                      //userPersonalInfoProvider.updateCapturedImage(File(file.path));
                                      _showLoadingDialog(context);
                                     // String? imageUrl = await uploadImageToFirestore(File(file.path));
                                      // Call saveDataToFirestore with the imageFile
                                     // print("image url: $imageUrl");
                                   //  await saveDataToFirestore(userPersonalInfoProvider, imageUrl, userPersonalInfoProvider.capturedImage);
                                      Navigator.of(context).pop();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => NavigationBottom()),
                                            (Route<dynamic> route) => false,
                                      );
                                    },
                                    child: Text("Save"),
                                  ),
                                ],
                              ),

                            ],
                            content: SizedBox(
                                width: double.infinity,
                                child: AspectRatio(
                                  aspectRatio: overlay.ratio!,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          alignment: FractionalOffset.center,
                                          image: FileImage(
                                            File(file.path),
                                          ),
                                        )),
                                  ),
                                )));
                      },
                    ),
                    info:
                    'Make sure the document is clearly visible and all information is readable',
                    label: 'Scanning');
              } else {
                return const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Fetching cameras',
                      style: TextStyle(color: Colors.black),
                    ));
              }
            },
          ),
        );
  }
}