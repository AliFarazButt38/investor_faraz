import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:investor_flutter/Model/user_model.dart';

class UserPersonalInfoProvider extends ChangeNotifier {

  String _selectedAccountType = '';
  String _selectedEmploymentStatus = '';
  String _employerName = '';
  String _jobTitle = '';
  String _occupationIndustry = '';
  String _dateOfBirth = '';
  String _socialSecurityNumber = '';
  String _address = '';
  String _selectedRelationshipStatus = '';

  String _enterpriseName='';
  String _formationDate='';
  String _signotaryTitle='';
  String _employerIdentificationNumber='';

  String _selectedEmployStatement = '';

  String _employmentStatusCompleted = '';
  String _accreditedInvestorCompleted ='';
  String _levelRiskCompleted = '';
  String _employedStatusCompleted = '';
  String _politicalStatusCompleted = '';

  File? _capturedImage;

  File? _uploadedFile;

  String? _imageUrl;
  List<String> _imageUrls = [];

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserModel? _userModel;
  FirebaseAuth _auth = FirebaseAuth.instance;

  getUserData() async {
    print('read work');
    QuerySnapshot querySnapshot;

    try {
      querySnapshot = await users.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          print('Document Data: ${doc.data()}'); // Add this line to see document data

          Map<String, dynamic> userDataMap = {
            "uid": doc.id,
            "email": doc['email'] ?? '',
            "profile_pic": doc['profile_pic'] ?? '',
            "account_type": doc['selected_account_type'] ?? '',
          };

          if (userDataMap['account_type'] == 'Individual') {
            userDataMap["employer_name"] = doc['employer_name'] ?? '';
            userDataMap["employer_status"] = doc['employment_status'] ?? '';
            userDataMap["job_title"] = doc['job_title'] ?? '';
            userDataMap["occupation_industry"] = doc['occupation_industry'] ?? '';
          } else if (userDataMap['account_type'] == 'Enterprise (Corporation or Trust)') {
            userDataMap["enterprise_Name"] = doc['enterprise_name'] ?? '';
            userDataMap["signatory_Title"] = doc['signatory_title'] ?? '';
            userDataMap["enterprise_formation_Date"] = doc['enterprise_formation_date'] ?? '';
          }

          if (doc.id == _auth.currentUser!.uid) {
            _userModel = UserModel.fromJson(userDataMap);
          }
        }
      }
    } catch (e) {
      print('catch error get users $e');
    } finally {
      notifyListeners();
    }
  }
  // getUserData() async {
  //   print('read work');
  //   QuerySnapshot querySnapshot;
  //
  //   try {
  //     querySnapshot =
  //     await users.get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         Map<String , dynamic> a = {
  //           "uid": doc.id,
  //           "email": doc['email'] ?? '',
  //           "profile_pic": doc["profile_pic"] ?? '',
  //           "account_type": doc['selected_account_type'] ?? '',
  //           "employer_name": doc["employer_name"] ?? '',
  //           "employer_status": doc['employment_status'] ?? '',
  //           "job_title": doc['job_title'] ?? '',
  //           "occupation_industry": doc["occupation_industry"] ?? '',
  //           "enterprise_Name":doc["enterprise_name"] ?? '',
  //           "signatory_Title":doc["signatory_title"] ?? '',
  //           "enterprise_formation_Date":doc["enterprise_formation_date"] ?? '',
  //
  //         };
  //
  //         if(doc.id == _auth.currentUser!.uid){
  //           // _usersList.add(UserModel.fromJson(a));
  //           print('user id ${doc.id}');
  //           _userModel = UserModel.fromJson(a);
  //         }
  //
  //       }
  //     }
  //   } catch (e) {
  //     print('catch error get users $e');
  //   }finally{
  //
  //     notifyListeners();
  //   }
  // }
  updateUser({
    String? name,
    String? email,
    String? jobTitle,
    String? occupation,
    String? pic,
    String? enterpriseName,
    String? signatoryTitle,
    String? enterpriseFormationDate,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userId = currentUser.uid;
        final userData = <String, dynamic>{};

        if (_userModel != null) {
          // Determine the account type
          if (_userModel!.accountType == 'Individual') {
            userData.addAll({
              'employer_name': name,
              'email': email,
              'job_title': jobTitle,
              'profile_pic': pic,
              'occupation_industry': occupation,
            });
          } else if (_userModel!.accountType ==
              'Enterprise (Corporation or Trust)') {
            userData.addAll({
              'enterprise_name': enterpriseName,
              'email': email,
              'signatory_title': signatoryTitle,
              'profile_pic': pic,
              'enterprise_formation_date': enterpriseFormationDate,
            });
          }

          // Update user data in Firestore
          await users.doc(userId).update(userData);

          // Refresh user data
          getUserData();

          print('User information updated successfully');
        }
      } else {
        print('No user is currently signed in');
      }
    } catch (error) {
      print('Error updating user information: $error');
    }
  }

  // updateUser(String name,email,jobTitle,occupation,pic) async {
  //   await users.doc(_auth.currentUser!.uid).update({
  //     'employer_name': name,
  //     'email': email,
  //     'job_title': jobTitle,
  //     'profile_pic': pic,
  //     'occupation_industry': occupation,
  //
  //
  //   }).then((value) {
  //     print('update info  ');
  //
  //     getUserData();
  //   }).catchError((error){
  //     print('error $error');
  //   });
  // }


  //accountType screen
  void updateSelectedAccountType(String accountType) {
    _selectedAccountType = accountType;
    notifyListeners();
  }
  //employment info screen
  void updateSelectedEmploymentStatus(String status) {
    _selectedEmploymentStatus = status;
    notifyListeners();
  }

  void updateEmployerName(String name) {
    _employerName = name;
    notifyListeners();
  }

  void updateJobTitle(String title) {
    _jobTitle = title;
    notifyListeners();
  }

  void updateOccupationIndustry(String industry) {
    _occupationIndustry = industry;
    notifyListeners();
  }

  //personal information screen

  void updateDateOfBirth(String dob) {
    _dateOfBirth = dob;
    notifyListeners();
  }

  void updateSocialSecurityNumber(String ssn) {
    _socialSecurityNumber = ssn;
    notifyListeners();
  }

  void updateAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void updateSelectedRelationshipStatus(String status) {
    _selectedRelationshipStatus = status;
    notifyListeners();
  }

  //fund account screen
  void updateEmploymentStatusCompleted(String employment) {
    _employmentStatusCompleted = employment;
    notifyListeners();
  }

  void updateAccreditedInvestorCompleted(String accredited) {
    _accreditedInvestorCompleted = accredited;
    notifyListeners();
  }

  void updateLevelRiskCompleted(String risk) {
    _levelRiskCompleted = risk;
    notifyListeners();
  }

  void updateEmployedStatusCompleted(String employed) {
    _employedStatusCompleted = employed;
    notifyListeners();
  }

  void updatePoliticalStatusCompleted(String political) {
    _politicalStatusCompleted = political;
    notifyListeners();
  }

  //EnterPrise info screen

  void updateEnterpriseName(String enterpriseName){
    _enterpriseName=enterpriseName;
    notifyListeners();
  }
  void updateFormationDate(String formationDate){
    _formationDate=formationDate;
    notifyListeners();
  }
  void updateSignatoryTitle(String signatoryTitle){
    _signotaryTitle=signatoryTitle;
    notifyListeners();
  }
  void updateEmployerIdentificationNumber(String identificationNumber){
    _employerIdentificationNumber=identificationNumber;
    notifyListeners();
  }

  //statementCheckScreen
  void updateEmploymentStatement(String statement) {
    _selectedEmployStatement = statement;
    notifyListeners();
  }


  //image
  void updateCapturedImage(File imageFile) {
    _capturedImage = imageFile;
    notifyListeners();
  }

  //upload document
  void updateUploadedFile(File file) {
    _uploadedFile = file;
    notifyListeners();
  }
  void updateImageUrl(String imageUrl) {
    _imageUrls.add(imageUrl); // Append the URL to the list
    notifyListeners();
  }

  String get employmentStatusCompleted => _employmentStatusCompleted;
  String get accreditedInvestorCompleted => _accreditedInvestorCompleted;
  String get levelRiskCompleted => _levelRiskCompleted;
  String get employedStatusCompleted => _employedStatusCompleted;
  String get politicalStatusCompleted => _politicalStatusCompleted;
  File? get capturedImage => _capturedImage;
  String get selectedAccountType=> _selectedAccountType;
  String get selectedEmploymentStatus=> _selectedEmploymentStatus;
  String get employerName=> _employerName;
  String get jobTitle=> _jobTitle;
  String get occupationIndustry=> _occupationIndustry;
  String get dateOfBirth=>_dateOfBirth;
  String get socialSecurityNumber=>_socialSecurityNumber;
  String get address=>_address;
  String get selectedRelationshipStatus=>_selectedRelationshipStatus;
  String get enterpriseName=>_enterpriseName;
  String get signotaryTitle=>_signotaryTitle;
  String get formationDate=>_formationDate;
  String get employerIdentificationNumber=>_employerIdentificationNumber;
  String get selectedEmployStatement=>_selectedEmployStatement;

  File? get uploadedFile => _uploadedFile;

  // String? get imageUrl => _imageUrl;

  UserModel? get user => _userModel;
  List<String> get imageUrl => _imageUrls;

}