import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../../Auth/firebaseStorage.dart';
import '../../../Auth/firestore_auth.dart';
import '../../../Provider/userProvider.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class EmploymentStatus {
  final String title;

  EmploymentStatus({required this.title});
}

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  int? selectedStatusIndex;
  bool isFileUploaded = false;

  bool areAllDocumentsUploaded() {
    final userPersonalInfoProvider =
    Provider.of<UserPersonalInfoProvider>(context, listen: false);
    return userPersonalInfoProvider.uploadedFile != null &&
        userPersonalInfoProvider.uploadedFile != null &&
        userPersonalInfoProvider.uploadedFile != null;
  }


  Future<void> _pickFile() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      Provider.of<UserPersonalInfoProvider>(context, listen: false)
          .updateUploadedFile(File(pickedFile.path));
    }
  }

  Future<void> _uploadToFirestore() async {
    final uploadedFile = Provider.of<UserPersonalInfoProvider>(context, listen: false).uploadedFile;

    if (uploadedFile != null) {
      final imageUrl = await uploadImageToFirestore(uploadedFile);
      Provider.of<UserPersonalInfoProvider>(context, listen: false).updateImageUrl(imageUrl);


    }
  }



  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'EIN Verification'),
    EmploymentStatus(title: 'Operating Agreement'),
    EmploymentStatus(title: 'Certificate of Formation'),
  ];



  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final userPersonalInfoProvider = Provider.of<UserPersonalInfoProvider>(context, listen: false);

    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor:
      isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/back.png",
                      height: 34.h,
                      width: 34.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 170.w),
                    child: SvgPicture.asset("assets/icons/investor.svg",
                        width: 48.w, height: 39.h),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Upload Documents",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color:
                  isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Upload your legal documents to complete\nenterprise account and invest fastly",
                style: TextStyle(
                  color: Palette.baseGrey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: employmentStatusList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    EmploymentStatus status = employmentStatusList[index];
                    bool isSelected = index == selectedStatusIndex;
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedStatusIndex =  index;
                        });


                        await _pickFile();

                        await _uploadToFirestore();
                        setState(() {
                          isFileUploaded = true;
                        });
                      },
                      child: Container(
                        width: 368.w,
                        height: 74.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected && isFileUploaded
                                ? Palette.blue
                                : (isDarkMode
                                ? Palette.hintText
                                : Palette.blueSides),
                            width: 2.0,
                          ),
                          color: isDarkMode
                              ? Palette.filledTextField
                              : Palette.textFieldBlue,
                        ),
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20.73.w,
                              height: 20.73.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected && isFileUploaded
                                      ? Palette.blue
                                      : (isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark),
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: isSelected && isFileUploaded
                                  ? Icon(
                                Icons.check,
                                color: Palette.blue,
                                size: 13.0,
                              )
                                  : null,
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Text(
                                status.title,
                                style: TextStyle(
                                  color:isSelected && isFileUploaded
                                      ? Palette.blue
                                      : (isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark),
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/icons/upload.png",
                              height: 34.h,
                              width: 34.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () async{
                    if (areAllDocumentsUploaded()) {
                      String? imageUrl = '';
                      await saveEnterpriseDataToFirestore(
                          userPersonalInfoProvider, imageUrl, userPersonalInfoProvider.capturedImage,userPersonalInfoProvider.imageUrl ?? []);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => NavigationBottom()),
                              (route) => false);
                    }else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Error',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            content: const Text(
                              'Please upload all documents',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16.0),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 4.0,
                          );
                        },
                      );
                    }

                  },
                  child: Container(
                    height: 56.h,
                    width: 304.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                          color: Palette.baseWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}