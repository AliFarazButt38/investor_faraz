import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:investor_flutter/Model/property_model.dart';

class PropertyInfoProvider extends ChangeNotifier{

  CollectionReference property= FirebaseFirestore.instance.collection('property');
  PropertyModel? _propertyModel;
  FirebaseAuth _auth=FirebaseAuth.instance;
  bool _isLoading = false;
  List<PropertyModel> _propertyList = [];
  List<String> categories = [];


  Future<void> getPropertyData() async {
    print("Property info");
    QuerySnapshot querySnapshot;

    try {
      _isLoading = true; // Set loading state to true
      notifyListeners();
      querySnapshot = await property.get();
      if (querySnapshot.docs.isNotEmpty) {
        _propertyList = querySnapshot.docs
            .map((doc) => PropertyModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
      print("property length ${_propertyList.length}");
    } catch (e) {
      print('Error fetching property data: $e');
    } finally {
      _isLoading = false; // Set loading state to false when data fetching is complete
      notifyListeners();

    }
  }

  Future<void> fetchCategories() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Category').get();

      if (querySnapshot.docs.isNotEmpty) {
        categories = querySnapshot.docs
            .map((doc) => doc['name'] as String)
            .toList();
        notifyListeners();
      }
    } catch (error) {
      // Handle any errors that occur during the database operation.
      print('Error fetching categories: $error');
      // You can add additional error handling code here as needed.
    }
  }

  Future<void> storeInvestmentData({
    required PropertyModel propertyModel, required double investmentAmount, required DateTime investmentDate,
    required investPerMonth, required bundle, required unit, required street,
    required zipCode, required developmentArc, required afterDevelopmentCapRate, required afterDevelopmentValue,
    required dispositionDate, required annualRentalCollection, required developmentCapRate,
    required afterDevelopmentValueArc,required country, required investPrice,
    required String userUid, // Add this parameter



  }) async {
    try {
      // Access the Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a new document in the "user_investments" collection
      await firestore.collection('user_investments').add({
        // 'property_id': propertyModel.id, // Assuming you have a unique property identifier
        'investment_amount': investmentAmount,
        'investment_date': Timestamp.fromDate(investmentDate),
        'invest_per_month':investPerMonth,
        'bundle':bundle,
        'unit':unit,
        'street':street,
        'zip_code':zipCode,
        'development_arc':developmentArc,
        'after_development_cap_rate':developmentCapRate,
        'after_development_value':afterDevelopmentValue,
        'disposition_date':dispositionDate,
        'annual_rental_collection':annualRentalCollection,
        'development_cap_rate':developmentCapRate,
        'after_development_value_arc':afterDevelopmentValueArc,
        'country':country,
        'invest_price':investPrice,
        'user_uid':userUid,

        // Add more fields as needed
      });

      // Successful data storage
      print('Investment data stored successfully!');
    } catch (error) {
      // Handle any errors that occur during data storage
      print('Error storing investment data: $error');
    }
  }

  List<PropertyModel> get propertyList => _propertyList;
  bool get isLoading => _isLoading;
  PropertyModel? get propertyModel => _propertyModel;
}
