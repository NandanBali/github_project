import 'package:flutter/material.dart';
import 'package:github_plus_plus/view/search/search.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

// log in screen
// todo: implement authentication using firebase with github
// todo: beautification
// todo: the welcome view should be able to save authentication token and materially refresh said tokens

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 500, maxWidth: MediaQuery.of(context).size.width),
              child: CarouselView(
                  itemSnapping: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
                  overlayColor: WidgetStatePropertyAll(Colors.black26.withOpacity(0.0)),
                  itemExtent: MediaQuery.of(context).size.width,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/code.jpg"),
                            fit: BoxFit.cover,
                            opacity: 0.6),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Code.",
                            style: TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.w600),
                          )),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/collaborate.jpg"),
                            fit: BoxFit.cover,
                            opacity: 0.6),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Collaborate.",
                            style: TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.w600),
                          )),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/share.jpg"),
                            fit: BoxFit.cover,
                            opacity: 0.6),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Share.",
                            style: TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.w600),
                          )),
                    ),
                  ]),
            ),
            SizedBox(height: 144.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 48.0)),
                  splashFactory: NoSplash.splashFactory,
                ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchView()));
                  },
                  child: Text("login", style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
