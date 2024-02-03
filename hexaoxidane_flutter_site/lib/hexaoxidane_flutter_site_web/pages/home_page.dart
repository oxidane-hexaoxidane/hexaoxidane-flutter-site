import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
              // child: Text(
              //   'HexaOxidane',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w900,
              //     fontSize: ResponsiveBreakpoints.of(context).isMobile ? 40 : 55,
              //   ),
              // ),
              child: Image.asset(
                'assets/images/promo/doctor_logo.png',
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat sem nec mollis viverra. Vestibulum condimentum nulla in ligula condimentum semper ac et ligula. Duis sit amet gravida dolor. Aenean ultricies pharetra neque at porttitor. Etiam magna urna, vulputate non finibus non, tristique varius metus. Sed libero nunc, facilisis a leo vel, hendrerit efficitur nunc. Nulla lorem sem, lobortis at purus id, cursus tincidunt metus. Praesent eu tempus mauris. Maecenas mi nisl, bibendum et porttitor a, tempus et dolor. Cras pellentesque lectus felis, luctus ullamcorper felis vehicula vitae. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum vel molestie magna. \n \n Integer rhoncus, diam in ultricies efficitur, arcu leo ultrices est, sit amet blandit ex sem eget diam. Praesent commodo diam eget lectus ultricies dictum. Curabitur pharetra pretium finibus. Vestibulum faucibus porttitor augue vel porttitor. Donec tellus velit, euismod ut dolor sit amet, vestibulum imperdiet neque. In porta ante vel eros tincidunt pharetra. Aenean sed ultrices tortor, ut ullamcorper sem. Sed rutrum bibendum nisl ac condimentum.!',
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
        ],
      ),
    );
  }
}
