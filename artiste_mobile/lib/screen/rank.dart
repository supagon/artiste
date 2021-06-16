import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:artiste_mobile/widgets/botnav.dart';
import 'package:artiste_mobile/widgets/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artiste_mobile/provider/Donator.dart';
import 'package:artiste_mobile/provider/DonationList.dart';
import 'package:provider/provider.dart';

class Rank extends StatefulWidget {
  List<Donator> donationList = [];

  Rank({this.donationList});
  static const routeName = '/purchase';

  @override
  _RankState createState() => _RankState();
}

class _RankState extends State<Rank> {
  void GetDonation() async {
    try {
      await Provider.of<DonationList>(context, listen: false)
          .fetchDonationList();
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDonation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            alignment: Alignment.topLeft,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Donation",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Consumer<DonationList>(builder: (context, value, child) {
                    final donationcard = value.donationList;
                    print(donationcard.length);
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: donationcard.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              donationcard[index].displayName,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22,
                                    color: kPrimaryColor),
                              ),
                            ),
                            Text(
                              donationcard[index].donation.toString() + " thb",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
/*                   ListView.builder(
                    itemCount: widget.donationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.donationList[index].displayName,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                  color: kPrimaryColor),
                            ),
                          ),
                          Text(
                            widget.donationList[index].donation.toString(),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                  color: kPrimaryColor),
                            ),
                          ),
                        ],
                      );
                    },
                  ), */
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BotNav(
          selectedIndex: 3,
        ),
      ),
    );
  }
}
