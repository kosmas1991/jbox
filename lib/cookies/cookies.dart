import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieConsentBanner extends StatefulWidget {
  @override
  _CookieConsentBannerState createState() => _CookieConsentBannerState();
}

//todo create a cookie policy page and add cookie banner at every page, not only homepage

class _CookieConsentBannerState extends State<CookieConsentBanner> {
  bool _isBannerVisible = false;

  @override
  void initState() {
    super.initState();
    _checkConsent();
  }

  void _checkConsent() async {
    final prefs = await SharedPreferences.getInstance();
    final consentGiven = prefs.getBool('cookie_consent') ?? false;
    if (!consentGiven) {
      setState(() {
        _isBannerVisible = true;
      });
    }
  }

  void _giveConsent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('cookie_consent', true);
    setState(() {
      _isBannerVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBannerVisible) return SizedBox.shrink();

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.black.withOpacity(0.8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Η σελίδα χρησιμοποιεί cookies για την βελτίωση της εμπειρίας χρήσης. Συνεχίζοντας στη σελίδα αποδέχεστε τη χρήση τους.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: _giveConsent,
                  child: Text(
                    'Αποδοχή',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            )));
  }
}
