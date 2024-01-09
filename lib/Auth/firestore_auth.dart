import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../Provider/userProvider.dart';

Future<void> saveDataToFirestore(UserPersonalInfoProvider userInfo,String imageUrl, File? capturedImage,) async {
  try {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {

      String userId = user.uid;
      Map<String, dynamic> userData = {
        'uid':user.uid,
        'email': user.email,
        'profile_pic': ' ',
        'selected_account_type': userInfo.selectedAccountType,
        'employment_status':userInfo.selectedEmploymentStatus,
        'employer_name':userInfo.employerName,
        'job_title':userInfo.jobTitle,
        'occupation_industry':userInfo.occupationIndustry,
        'dob':userInfo.dateOfBirth,
        'social_number':userInfo.socialSecurityNumber,
        'address':userInfo.address,
        'relation_ship_status':userInfo.selectedRelationshipStatus,
        'fund_your_account':userInfo.employmentStatusCompleted,
        'accredited_investor':userInfo.accreditedInvestorCompleted,
        'risk_level':userInfo.levelRiskCompleted,
        'employed_or_associated_withStockExchange_or_firna':userInfo.employedStatusCompleted,
        'politically_exposed_person':userInfo.politicalStatusCompleted,
        'security_card/driving_license': imageUrl,
      };
      await firestore.collection('users').doc(userId).set(userData);

      print('Data saved to Firestore successfully!');
    } else {
      print('No user is currently signed in.');
    }
  } catch (e) {
    // Handle errors
    print('Error saving data to Firestore: $e');
  }
}


Future<void> saveEnterpriseDataToFirestore(UserPersonalInfoProvider userInfo,String imageUrl,
    File? capturedImage, List<String> imageUrls,
    ) async {
  try {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {

      String userId = user.uid;
      Map<String, dynamic> userData = {
        'uid':user.uid,
        'email': user.email,
        'profile_pic':' ',
        'selected_account_type': userInfo.selectedAccountType,
        'enterprise_name':userInfo.enterpriseName,
        'enterprise_formation_date':userInfo.formationDate,
        'signatory_title':userInfo.signotaryTitle,
        'employer_identification_number':userInfo.employerIdentificationNumber,
        'statement_apply_toYou':userInfo.selectedEmployStatement,
        'upload_documents_links':FieldValue.arrayUnion(imageUrls),
      };
      await firestore.collection('users').doc(userId).set(userData,SetOptions(merge: true));
      print('Data saved to Firestore successfully!');
    } else {
      print('No user is currently signed in.');
    }
  } catch (e) {
    // Handle errors
    print('Error saving data to Firestore: $e');
  }
}