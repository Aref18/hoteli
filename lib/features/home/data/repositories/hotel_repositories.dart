import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/shared/services/jason_data_service.dart';

class HotelRepositories {
  final JasonDataService jsonDataService;

  HotelRepositories({required this.jsonDataService});

  Future<List<Hotel>> fetchHotel() async {
    return jsonDataService.loadHotels();
  }

  Future<Hotel> getHotelById(String id) {
    return jsonDataService.loadHotels().then(
      (hotels) {
        return hotels.firstWhere(
          (hotel) => hotel.id == id,
        );
      },
    );
  }
}
