import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view_model/course/turf_controller.dart';
import '../widget/booking_details.dart';

class CompletedBooking extends StatelessWidget {
  const CompletedBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final TurfController controller = Get.find();
    final height = MediaQuery.of(context).size.height;
    final completedBookings = controller.completedBookings;
    final width = MediaQuery.of(context).size.width;
    Future<void> refresh() async {
      await controller.separateBookings();
    }

    return Obx(() {
      if (controller.isLoadingBookings) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.errorMessageBookings.isNotEmpty) {
        return Center(
          child: Text(controller.errorMessageBookings),
        );
      } else {
        if (completedBookings.isEmpty) {
          return RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                alignment: Alignment.center,
                child: const Text(
                  "No Completed bookings are available",
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
              itemCount: completedBookings.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.02,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Column(
                      children: [
                        BookingDetails(
                          turf: completedBookings[index],
                        ),
                        SizedBox(height: height * 0.02),
                        const Text(
                          "Well Played floks",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }
    });
  }
}
