import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
   String uid,email,picture,password,accountType,employStatus,employerName,jobTitle,occupationIndustry,
       enterpriseName,signatoryTitle,enterpriseFormationDate;


  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.accountType,
    required this.employerName,
    required this.employStatus,
    required this.jobTitle,
    required this.occupationIndustry,
    required this.picture,

    required this.enterpriseName,
    required this.signatoryTitle,
    required this.enterpriseFormationDate,

  });

  // // Create a factory method to convert Firestore document snapshot to UserModel
  // factory UserModel.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return UserModel(
  //     uid: doc.id,
  //     email: data['email'],
  //     // Initialize other fields here
  //   );
  // }

   factory UserModel.fromJson(Map<String,dynamic> data){
     return UserModel(picture: data['profile_pic'] ?? '',
         uid: data['uid'], email: data['email'] ?? '',
         password: data['password'] ?? '', accountType: data['account_type'] ?? '',
         employerName: data['employer_name'] ?? '',
         employStatus: data['employer_status'] ?? '',
         jobTitle: data['job_title'] ?? '',
         occupationIndustry: data['occupation_industry'] ?? '',
         enterpriseName: data['enterprise_Name'] ?? '',
         signatoryTitle: data['signatory_Title'] ?? '',
         enterpriseFormationDate: data['enterprise_formation_Date'] ?? ''
     );
   }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      // Add other fields here
    };
  }
}
