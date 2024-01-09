import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investor_flutter/Model/user_model.dart';
import 'package:investor_flutter/Provider/userProvider.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:provider/provider.dart';
import '../../../Auth/firebaseStorage.dart';
import '../../../Theme/theme_manager.dart';

class UpdateProfileScreen extends StatefulWidget {
  UserModel? userModel;
   UpdateProfileScreen({Key? key,  this.userModel}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController employerController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController enterpriseController=TextEditingController();
  TextEditingController signatoryController=TextEditingController();
  TextEditingController fromationController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? _imageFile;

  String? networkImage;

  final picker = ImagePicker();

  void _showPhotoLibrary() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState((){
      if(pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
    networkImage = await uploadImageToFirestore(_imageFile!);
    print('download url $networkImage');
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet (
        context: context,
        builder: (context) {
          return SizedBox (
              height: 150,
              child: Column(children: <Widget> [
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showCamera(context);
                    },
                    leading: const Icon(Icons.photo_camera),
                    title: const Text("Take a picture from camera")
                ),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Choose from photo library")
                )
              ])
          );
        }
    );
  }

  void _showCamera(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.userModel != null){
      fullnameController = TextEditingController(text: widget.userModel!.employerName);
      emailController = TextEditingController(text: widget.userModel!.email);
       employerController = TextEditingController(text: widget.userModel!.employerName);
      occupationController = TextEditingController(text: widget.userModel!.occupationIndustry);
      jobController = TextEditingController(text: widget.userModel!.jobTitle);
      enterpriseController = TextEditingController(text:  widget.userModel!.enterpriseName);
      signatoryController=TextEditingController(text: widget.userModel!.signatoryTitle);
      fromationController=TextEditingController(text: widget.userModel!.enterpriseFormationDate);
      networkImage=widget.userModel!.picture;
    }
  }
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          child: SingleChildScrollView(
            child:Consumer<UserPersonalInfoProvider>(

                builder: (context, userProvider, child) {
                return Column(
                  children: [

                    if (userProvider.user != null &&
                        userProvider.user!.accountType == 'Individual')
                      _buildIndividualInfo(userProvider, isDarkMode)
                    else if (userProvider.user != null &&
                        userProvider.user!.accountType == 'Enterprise (Corporation or Trust)')
                      _buildEnterpriseInfo(userProvider, isDarkMode),

                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildIndividualInfo(
      UserPersonalInfoProvider userProvider, bool isDarkMode) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isDarkMode? GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Image.asset("assets/icons/darkBack.png",height: 46.h,width: 46.w,),
            ):
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Image.asset("assets/icons/goBack.png",height: 46.h,width: 46.w,),
            ),
            SizedBox(width: 20.w,),
            Text("Personal Profile",style: TextStyle(
              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),),
            Spacer(),
            InkWell(
                onTap: (){
                  Provider.of<UserPersonalInfoProvider>(context, listen: false).updateUser(
                    name: fullnameController.text,
                    email: emailController.text,
                    jobTitle: jobController.text,
                    occupation: occupationController.text,
                    pic: networkImage,

                  );
                },
                child: SvgPicture.asset("assets/icons/editBlue.svg",height: 46.h,width: 46.w,)),

          ],
        ),
        SizedBox(height: 10.h,),
        Divider(
          color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
          thickness: 1,
        ),
        SizedBox(height: 10.h,),
        //SvgPicture.asset("assets/icons/camera.svg",height: 150.h,width: 150.w,),
        // InkWell(
        //   onTap: (){
        //     _showPhotoLibrary();
        //   },
        //   child: SizedBox(
        //     height: 150.h,
        //     width: 150.w,
        //     child: _imageFile == null && (networkImage == '' || networkImage == null) ? SvgPicture.asset("assets/icons/camera.svg",height: 150.h,width: 150.w,)
        //         : _imageFile == null ?
        //     Container(
        //       height: 150.h,
        //       width: 150.w,
        //       decoration:   BoxDecoration(
        //           shape: BoxShape.circle,
        //
        //           image: DecorationImage(
        //               image:  NetworkImage(networkImage!),
        //               fit: BoxFit.cover
        //           )
        //       ),
        //       // child: ClipRRect(
        //       //   borderRadius: BorderRadius.circular(100),
        //       //   child: Image.network(  networkImage!,),
        //       // ),
        //     )
        //         :
        //     Container(
        //       height: 150.h,
        //       width: 150.w,
        //       decoration:  BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //               image:  FileImage(_imageFile!),
        //               fit: BoxFit.cover
        //           )
        //       ),
        //     ),
        //   ),
        // ),
        InkWell(
          onTap: () {
            _showPhotoLibrary();
          },
          child: SizedBox(
            height: 150.h,
            width: 150.w,
            child: _imageFile == null && (networkImage == null || networkImage!.trim().isEmpty)
                ? SvgPicture.asset("assets/icons/camera.svg", height: 150.h, width: 150.w)
                : _imageFile == null
                ? Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: networkImage != null
                      ? NetworkImage(networkImage!)
                      : Image.asset("assets/icons/camera.svg").image,
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Divider(
          color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
          thickness: 1,
        ),
        SizedBox(height: 10.h,),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: fullnameController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    hintStyle: TextStyle(
                      color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ), errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Palette.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField : Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter name';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Email",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "example@gmail.com",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter date ';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Employer Name",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: fullnameController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(

                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "John Wick",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Job Title",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: jobController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Manager",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Occupation Industry",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: occupationController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Industry Name",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
              ],
            )),
        SizedBox(height: 30.h,),
      ],
    );
  }
  Widget _buildEnterpriseInfo(
      UserPersonalInfoProvider userProvider, bool isDarkMode) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isDarkMode? GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Image.asset("assets/icons/darkBack.png",height: 46.h,width: 46.w,),
            ):
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Image.asset("assets/icons/goBack.png",height: 46.h,width: 46.w,),
            ),
            SizedBox(width: 20.w,),
            Text("Personal Profile",style: TextStyle(
              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),),
            Spacer(),
            InkWell(
                onTap: (){
                  Provider.of<UserPersonalInfoProvider>(context, listen: false).updateUser(
                    email: emailController.text,
                    enterpriseName: enterpriseController.text,
                    signatoryTitle: signatoryController.text,
                    pic: networkImage,
                    enterpriseFormationDate:fromationController.text,
                  );
                },
                child: SvgPicture.asset("assets/icons/editBlue.svg",height: 46.h,width: 46.w,)),

          ],
        ),
        SizedBox(height: 10.h,),
        Divider(
          color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
          thickness: 1,
        ),
        SizedBox(height: 10.h,),
        //SvgPicture.asset("assets/icons/camera.svg",height: 150.h,width: 150.w,),
        // InkWell(
        //   onTap: (){
        //     _showPhotoLibrary();
        //   },
        //   child: SizedBox(
        //     height: 150.h,
        //     width: 150.w,
        //     child: _imageFile == null && (networkImage == '' || networkImage == null) ? SvgPicture.asset("assets/icons/camera.svg",height: 150.h,width: 150.w,)
        //         : _imageFile == null ?
        //     Container(
        //       height: 150.h,
        //       width: 150.w,
        //       decoration:   BoxDecoration(
        //           shape: BoxShape.circle,
        //
        //           image: DecorationImage(
        //               image:  NetworkImage(networkImage!),
        //               fit: BoxFit.cover
        //           )
        //       ),
        //       // child: ClipRRect(
        //       //   borderRadius: BorderRadius.circular(100),
        //       //   child: Image.network(  networkImage!,),
        //       // ),
        //     )
        //         :
        //     Container(
        //       height: 150.h,
        //       width: 150.w,
        //       decoration:  BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //               image:  FileImage(_imageFile!),
        //               fit: BoxFit.cover
        //           )
        //       ),
        //     ),
        //   ),
        // ),
        InkWell(
          onTap: () {
            _showPhotoLibrary();
          },
          child: SizedBox(
            height: 150.h,
            width: 150.w,
            child: _imageFile == null && (networkImage == null || networkImage!.trim().isEmpty)
                ? SvgPicture.asset("assets/icons/camera.svg", height: 150.h, width: 150.w)
                : _imageFile == null
                ? Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: networkImage != null
                      ? NetworkImage(networkImage!)
                      : Image.asset("assets/icons/camera.svg").image,
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),



        SizedBox(height: 10.h,),
        Divider(
          color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
          thickness: 1,
        ),
        SizedBox(height: 10.h,),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Email",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "example@gmail.com",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter date ';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Enterprise Name",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: enterpriseController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(

                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "John Wick",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Signatory Title",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: signatoryController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Manager",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 15.h,),
                Text("Enterprise formation date",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 5.h,),
                TextFormField(
                  controller: fromationController,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Palette.baseElementDark,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Industry Name",
                    hintStyle: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.blue ,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                  ),
                  validator: (text) {
                    if(text!.isEmpty){
                      return 'enter title';
                    }

                    return null;
                  },
                ),
              ],
            )),
        SizedBox(height: 30.h,),
      ],
    );

  }
}
