import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_engine/hexaoxidane_flutter_engine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      background: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Image.asset(
          'assets/images/promo/deity_beauty_shot_1.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
      body: PageContentScaffold(
        alignment: PageContentAlignment(
          direction: PageContentDirection.vertical,
        ),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/promo/doctor_logo_2.png',
                width: 700,
                height: 230,
              ),
            ),
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: double.infinity,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // const SizedBox(height: 20),
                    // const Text('We are making the game...', style: TextStyles.display),
                    const Text(
                      "DOCTOR! is an adult game set in the medieval era during the times of plague, and you're a doctor. There were many types of diseases looming around such as cold, fever, etc, but there is one particular type that baffles everyone. It's the kind of illness that mostly affects women, and no one knows when it will hit; one just kinda gets it, and what's scary is you don't know what's gonna happen to them as some became depressed, some got lonely, and others even got rabid. \n\nFortunately, as the doctor, you know the cure. You know exactly what these women need. A huge, big, and juicy cock only you can provide.",
                      style: TextStyles.display,
                    ),
                    const SizedBox(height: 100),
                    const Text('Stay tuned!', style: TextStyles.heading3),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: Image.asset('assets/images/socials/x.jpg'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: Image.asset('assets/images/socials/reddit.png'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: Image.asset('assets/images/socials/youtube.png'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: Image.asset('assets/images/socials/f95zone.png'),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Join our maling list?', style: TextStyles.heading3),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        // https://mailchi.mp/6cf31d006fcb/hexaoxidane-updates
                        Uri uri = Uri.https('mailchi.mp', '6cf31d006fcb/hexaoxidane-updates');
                        launchUrl(uri);
                      },
                      child: const Text('Yes, let\'s go!'),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 150),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'HexaOxidane',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              '© 2024',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
