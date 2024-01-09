
class PropertyModel{
  String developmentArc,developmentValue,developmentValueArc,annualRentalCollection,bundle,category,city,country,contact,
      date,depositionDate,developmentCapRate,developmentCapRateArc,email,estimateDepositionRate,investPerMonth,
      investPrice,jobTitle,name,status,street,unite,zipCode;
  List<String>? projectPresentation;
  List<String>? sliderImage;
  PropertyModel({
    required this.developmentArc,
    required this.developmentValue,
    required this.developmentValueArc,
    required this.annualRentalCollection,
    required this.bundle,
    required this.category,
    required this.city,
    required this.contact,
    required this.country,
    required this.date,
    required this.depositionDate,
    required this.developmentCapRate,
    required this.developmentCapRateArc,
    required this.email,
    required this.estimateDepositionRate,
    required this.investPerMonth,
    required this.investPrice,
    required this.jobTitle,
    required this.name,required this.status,required this.street,required this.unite,required this.zipCode,
    required this.projectPresentation,
    required this.sliderImage,

  });
  factory PropertyModel.fromJson(Map<String, dynamic> data) {
    return PropertyModel(
      developmentArc: data['after_development_arc'] ?? '',
      developmentValue: data['after_development_value'] ?? '',
      developmentValueArc: data['after_development_value_arc'] ?? '',
      annualRentalCollection: data['annual_rental_collection'] ?? '',
      bundle: data['bundle'] ?? '',
      category: data['category'] ?? '',
      city: data['city'] ?? '',
      contact: data['contact'] ?? '',
      country: data['country'] ?? '',
      date: data['date'] ?? '',
      depositionDate: data['deposition_date'] ?? '',
      developmentCapRate: data['development_cap_rate'] ?? '',
      developmentCapRateArc: data['development_cap_rate_arc'] ?? '',
      email: data['email'] ?? '',
      estimateDepositionRate: data['estimate_disposition_rate'] ?? '',
      investPerMonth: data['invest_per_month'] ?? '',
      investPrice: data['invest_price'] ?? '',
      jobTitle: data['job_title'] ?? '',
      name: data['name'] ?? '',
      status: data['status'] ?? '',
      street: data['street'] ?? '',
      unite: data['unite'] ?? '',
      zipCode: data['zip_code'] ?? '',
      projectPresentation: (data['project_presentation'] as List<dynamic>?)
          ?.map((dynamic item) => item.toString())
          .toList(),
      sliderImage: (data['slider_image'] as List<dynamic>?)
          ?.map((dynamic item) => item.toString())
          .toList(),
    );
  }

}