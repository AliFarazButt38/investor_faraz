class MyInvestmentModel {
  String afterDevelopmentArc;
  String afterDevelopmentValue;
  String afterDevelopmentCapRate;
  String annualRentalCollection;
  String bundle;
  String country;
  String zipCode;
  String developmentArc;
  String developmentCapRate;
  String dispositionDate;
  String investPerMonth;
  String investmentAmount;
  String unit;
  String street;

  MyInvestmentModel({
    required this.afterDevelopmentArc,
    required this.afterDevelopmentValue,
    required this.afterDevelopmentCapRate,
    required this.annualRentalCollection,
    required this.bundle,
    required this.country,
    required this.zipCode,
    required this.developmentArc,
    required this.developmentCapRate,
    required this.dispositionDate,
    required this.investPerMonth,
    required this.investmentAmount,
    required this.unit,
    required this.street,
  });

  factory MyInvestmentModel.fromJson(Map<String, dynamic> data) {
    return MyInvestmentModel(
      afterDevelopmentArc: data['after_development_value_arc']?.toString() ?? '',
      afterDevelopmentValue: data['after_development_value']?.toString() ?? '',
      afterDevelopmentCapRate: data['after_development_cap_rate']?.toString() ?? '',
      annualRentalCollection: data['annual_rental_collection']?.toString() ?? '',
      bundle: data['bundle']?.toString() ?? '',
      country: data['country']?.toString() ?? '',
      zipCode: data['zip_code']?.toString() ?? '',
      developmentArc: data['development_arc']?.toString() ?? '',
      developmentCapRate: data['development_cap_rate']?.toString() ?? '',
      dispositionDate: data['disposition_date']?.toString() ?? '',
      investPerMonth: data['invest_per_month']?.toString() ?? '',
      investmentAmount: data['investment_amount']?.toString() ?? '',
      unit: data['unit']?.toString() ?? '',
      street: data['street']?.toString() ?? '',
    );
  }
}
