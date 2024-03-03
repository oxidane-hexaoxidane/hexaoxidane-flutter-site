import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_engine/hexaoxidane_flutter_engine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageStorageKey _pageStorageKey = const PageStorageKey('home_page');

  YoutubePlayerController? _youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    _youtubePlayerController = YoutubePlayerController.fromVideoId(
      videoId: 'MHh3hlOEjQg',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    const Color backgroundColor = Color.fromARGB(235, 107, 65, 39);
    const Color textColor = Color.fromARGB(255, 228, 205, 104);

    TextStyle headerTextStyle = GoogleFonts.cinzel(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );

    TextStyle displayTextStyle = GoogleFonts.literata(
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    );

    return PageScaffold(
      key: _pageStorageKey,
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
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ColoredBox(
              color: backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "DOCTOR! is an adult game set in the medieval times where everyone got hit by the urge... and your the doctor. There were many types of diseases looming around such as cold, fever, etc, but there is one particular type that baffles everyone. It's the kind of illness that mostly affects women, and no one knows when it will hit; one just kinda gets it... and what's scary is you don't know what's gonna happen to them as some became depressed, some got lonely, and others even got rabid. \n\nFortunately, as the doctor, you know the cure. You know exactly what these women need. A huge, big, and juicy cock only you can provide.",
                      style: displayTextStyle,
                    ),
                    if (_youtubePlayerController != null) const SizedBox(height: 50),
                    if (_youtubePlayerController != null)
                      Stack(
                        key: _pageStorageKey,
                        fit: StackFit.loose,
                        children: [
                          YoutubePlayer(
                            controller: _youtubePlayerController!,
                            aspectRatio: 16 / 9,
                          ),
                          Positioned.fill(
                            child: PointerInterceptor(
                              child: GestureDetector(
                                onTap: () async {
                                  PlayerState playerState =
                                      await _youtubePlayerController!.playerState;
                                  if (playerState != PlayerState.playing) {
                                    _youtubePlayerController!.playVideo();
                                  } else if (playerState == PlayerState.playing) {
                                    _youtubePlayerController!.pauseVideo();
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 50),
                    Text(
                      'Stay tuned!',
                      style: headerTextStyle,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              launchUrl(
                                Uri.https('patreon.com', '/HexaOxidane'),
                                webOnlyWindowName: '_blank',
                              );
                            },
                            icon: Image.asset('assets/images/socials/patreon.png'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              launchUrl(
                                Uri.https('twitter.com', '/HexaOxidane'),
                                webOnlyWindowName: '_blank',
                              );
                            },
                            icon: Image.asset('assets/images/socials/x.jpg'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              launchUrl(
                                Uri.https('reddit.com', '/user/HexaOxidane'),
                                webOnlyWindowName: '_blank',
                              );
                            },
                            icon: Image.asset('assets/images/socials/reddit.png'),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              launchUrl(
                                Uri.https('youtube.com', '/channel/UCTgfkcsUVY0eD7gf7jcEZfg'),
                                webOnlyWindowName: '_blank',
                              );
                            },
                            icon: Image.asset('assets/images/socials/youtube.png'),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 50,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        Image.asset(
                          'assets/images/promo/deity_1.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/promo/deity_doctor_1.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/promo/doctor_4.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/promo/doctor_3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Text(
                      'COMING 2024',
                      style: headerTextStyle,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Join our mailing list?',
                      style: headerTextStyle,
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        // https://mailchi.mp/6cf31d006fcb/hexaoxidane-updates
                        launchUrl(Uri.https('mailchi.mp', '6cf31d006fcb/hexaoxidane-updates'));
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
