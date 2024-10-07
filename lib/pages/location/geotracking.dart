import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kPrimaryColor = Color(0xFF1A8500);

class GeoTracking extends StatefulWidget {
  const GeoTracking({super.key});

  @override
  _GeoTrackingState createState() => _GeoTrackingState();
}

class _GeoTrackingState extends State<GeoTracking> {
  String _locationMessage = "";
  Position? _currentPosition;
  bool _isLoading = false; // Added loading state variable

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    setState(() {
      _isLoading = true; // Set loading state to true when fetching starts
    });

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Location services are disabled.';
        _isLoading = false; // Stop loading if there's an error
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied';
          _isLoading = false; // Stop loading if permission is denied
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage =
            'Location permissions are permanently denied, we cannot request permissions.';
        _isLoading = false; // Stop loading
      });
      return;
    }

    // When we reach here, permissions are granted, and we can access the location.
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _locationMessage =
            "Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}";
        _isLoading = false; // Stop loading after fetching location
      });

      // Store latitude and longitude in SharedPreferences
      SharedPreferences locPrefs = await SharedPreferences.getInstance();
      await locPrefs.setDouble('latitude', _currentPosition!.latitude);
      await locPrefs.setDouble('longitude', _currentPosition!.longitude);
    } catch (e) {
      setState(() {
        _locationMessage = 'Error retrieving location';
        _isLoading = false; // Stop loading if an error occurs
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Geolocation Tracking',
          style: TextStyle(color: kPrimaryColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _locationMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Button(
              onPressed: _isLoading
                  ? null
                  : _determinePosition, // Disable button when loading
              text: _isLoading
                  ? 'Loading...'
                  : 'Get Current Location', // Show "Loading..." when in loading state
            ),
          ],
        ),
      ),
    );
  }
}
