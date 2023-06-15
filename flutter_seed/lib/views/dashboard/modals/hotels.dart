import 'dart:convert';

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));

class Hotels {
  List<Hotel>? hotels;

  Hotels({this.hotels});

  Hotels.fromJson(Map<String, dynamic> json) {
    if (json['hotels'] != null) {
      hotels = <Hotel>[];
      json['hotels'].forEach((v) {
        hotels!.add(Hotel.fromJson(v));
      });
    }
  }
}

class Hotel {
  int? hotelId;
  int? chainId;
  String? chainName;
  int? brandId;
  String? brandName;
  String? hotelName;
  String? hotelFormerlyName;
  String? hotelTranslatedName;
  String? addressline1;
  String? addressline2;
  String? zipcode;
  String? city;
  String? state;
  String? country;
  String? countryisocode;
  double? starRating;
  double? longitude;
  double? latitude;
  String? url;
  String? checkin;
  String? checkout;
  int? numberrooms;
  int? numberfloors;
  int? yearopened;
  int? yearrenovated;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? photo5;
  String? overview;
  int? ratesFrom;
  int? continentId;
  String? continentName;
  int? cityId;
  int? countryId;
  int? numberOfReviews;
  double? ratingAverage;
  String? ratesCurrency;

  Hotel(
      {this.hotelId,
      this.chainId,
      this.chainName,
      this.brandId,
      this.brandName,
      this.hotelName,
      this.hotelFormerlyName,
      this.hotelTranslatedName,
      this.addressline1,
      this.addressline2,
      this.zipcode,
      this.city,
      this.state,
      this.country,
      this.countryisocode,
      this.starRating,
      this.longitude,
      this.latitude,
      this.url,
      this.checkin,
      this.checkout,
      this.numberrooms,
      this.numberfloors,
      this.yearopened,
      this.yearrenovated,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.photo5,
      this.overview,
      this.ratesFrom,
      this.continentId,
      this.continentName,
      this.cityId,
      this.countryId,
      this.numberOfReviews,
      this.ratingAverage,
      this.ratesCurrency});

  Hotel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    chainId = json['chain_id'];
    chainName = json['chain_name'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    hotelName = json['hotel_name'];
    hotelFormerlyName = json['hotel_formerly_name'];
    hotelTranslatedName = json['hotel_translated_name'];
    addressline1 = json['addressline1'];
    addressline2 = json['addressline2'];
    zipcode = json['zipcode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    countryisocode = json['countryisocode'];
    starRating = json['star_rating'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    url = json['url'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    numberrooms = json['numberrooms'];
    numberfloors = json['numberfloors'];
    yearopened = json['yearopened'];
    yearrenovated = json['yearrenovated'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
    photo5 = json['photo5'];
    overview = json['overview'];
    ratesFrom = json['rates_from'];
    continentId = json['continent_id'];
    continentName = json['continent_name'];
    cityId = json['city_id'];
    countryId = json['country_id'];
    numberOfReviews = json['number_of_reviews'];
    ratingAverage = json['rating_average'];
    ratesCurrency = json['rates_currency'];
  }
}
