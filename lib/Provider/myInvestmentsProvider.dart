
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:investor_flutter/Model/myInvestmenstModel.dart';

class MyInvestmentsProvider extends ChangeNotifier{

  CollectionReference myInvestment= FirebaseFirestore.instance.collection('user_investments');
  MyInvestmentModel? _myInvestmentModel;
  bool _isLoading = false;
  List<MyInvestmentModel> _myInvestmentList = [];
  Future<void> getInvestmentData() async {
    print("investment info");
    QuerySnapshot querySnapshot;

    try {
      _isLoading = true; // Set loading state to true
      notifyListeners();
      querySnapshot = await myInvestment.get();
      if (querySnapshot.docs.isNotEmpty) {
        _myInvestmentList = querySnapshot.docs
            .map((doc) => MyInvestmentModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
      print("investments length ${_myInvestmentList.length}");
    } catch (e) {
      print('Error fetching investment data: $e');
    } finally {
      _isLoading = false; // Set loading state to false when data fetching is complete
      notifyListeners();

    }
  }

  List<MyInvestmentModel> get myInvestmentList => _myInvestmentList;
  bool get isLoading => _isLoading;
}