import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:all_academies/features/auth/presentation/login_page.dart';
import 'package:all_academies/features/auth/presentation/signup_page.dart';
import 'package:all_academies/widgets/text.dart';
import 'package:all_academies/pages/question-answer.dart';
import 'package:all_academies/core/theme.dart';
import 'package:all_academies/services/auth_storage.dart';
import 'package:all_academies/core/widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AppStarter()));
}

class AppStarter extends StatelessWidget {
  const AppStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: AuthStorage.getToken(), // Fetch token asynchronously
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())));
        }

        String initialRoute = (snapshot.data == null || snapshot.data!.isEmpty)
            ? '/login'
            : '/home';
        return MyApp(initialRoute: initialRoute);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  final String topicSubtitle = "Stability";
  final String topicContent = '''
  It is one thing to have a system in equilibrium; it is quite another for it to be stable. The toy doll perched on the man’s hand in Figure 9.10, for
        example, is not in stable equilibrium. There are three types of equilibrium: stable, unstable, and neutral. Figures throughout this module illustrate
        various examples.
        Figure 9.10 presents a balanced system, such as the toy doll on the man’s hand, which has its center of gravity (cg) directly over the pivot, so that
        the torque of the total weight is zero. This is equivalent to having the torques of the individual parts balanced about the pivot point, in this case the
        hand. The cgs of the arms, legs, head, and torso are labeled with smaller type.

        A system is said to be in stable equilibrium if, when displaced from equilibrium, it experiences a net force or torque in a direction opposite to the
        direction of the displacement. For example, a marble at the bottom of a bowl will experience a restoring force when displaced from its equilibrium
        position. This force moves it back toward the equilibrium position. Most systems are in stable equilibrium, especially for small displacements. For
        another example of stable equilibrium, see the pencil in Figure 9.11.

        A system is in unstable equilibrium if, when displaced, it experiences a net force or torque in the same direction as the displacement from
        equilibrium. A system in unstable equilibrium accelerates away from its equilibrium position if displaced even slightly. An obvious example is a ball
        resting on top of a hill. Once displaced, it accelerates away from the crest. See the next several figures for examples of unstable equilibrium.


        A system is in neutral equilibrium if its equilibrium is independent of displacements from its original position. A marble on a flat horizontal surface is
        an example. Combinations of these situations are possible. For example, a marble on a saddle is stable for displacements toward the front or back of
        the saddle and unstable for displacements to the side. Figure 9.16 shows another example of neutral equilibrium.

        When we consider how far a system in stable equilibrium can be displaced before it becomes unstable, we find that some systems in stable
        equilibrium are more stable than others. The pencil in Figure 9.11 and the person in Figure 9.17(a) are in stable equilibrium, but become unstable for
        relatively small displacements to the side. The critical point is reached when the cg is no longer above the base of support. Additionally, since the cg
        of a person’s body is above the pivots in the hips, displacements must be quickly controlled. This control is a central nervous system function that is
        developed when we learn to hold our bodies erect as infants. For increased stability while standing, the feet should be spread apart, giving a larger
        base of support. Stability is also increased by lowering one’s center of gravity by bending the knees, as when a football player prepares to receive a
        ball or braces themselves for a tackle. A cane, a crutch, or a walker increases the stability of the user, even more as the base of support widens.
        Usually, the cg of a female is lower (closer to the ground) than a male. Young children have their center of gravity between their shoulders, which
        increases the challenge of learning to walk.

        Figure 9.17 (a) The center of gravity of an adult is above the hip joints (one of the main pivots in the body) and lies between two narrowly-separated feet. Like a pencil
        standing on its eraser, this person is in stable equilibrium in relation to sideways displacements, but relatively small displacements take his cg outside the base of support and
        make him unstable. Humans are less stable relative to forward and backward displacements because the feet are not very long. Muscles are used extensively to balance the
        body in the front-to-back direction. (b) While bending in the manner shown, stability is increased by lowering the center of gravity. Stability is also increased if the base is
        expanded by placing the feet farther apart.
        Animals such as chickens have easier systems to control. Figure 9.18 shows that the cg of a chicken lies below its hip joints and between its widely
        separated and broad feet. Even relatively large displacements of the chicken’s cg are stable and result in restoring forces and torques that return the
        cg to its equilibrium position with little effort on the chicken’s part. Not all birds are like chickens, of course. Some birds, such as the flamingo, have
        balance systems that are almost as sophisticated as that of humans.
        Figure 9.18 shows that the cg of a chicken is below the hip joints and lies above a broad base of support formed by widely-separated and large feet.
        Hence, the chicken is in very stable equilibrium, since a relatively large displacement is needed to render it unstable. The body of the chicken is
        supported from above by the hips and acts as a pendulum between the hips. Therefore, the chicken is stable for front-to-back displacements as well
        as for side-to-side displacements.

        Engineers and architects strive to achieve extremely stable equilibriums for buildings and other systems that must withstand wind, earthquakes, and
        other forces that displace them from equilibrium. Although the examples in this section emphasize gravitational forces, the basic conditions for
        equilibrium are the same for all types of forces. The net external force must be zero, and the net torque must also be zero.
  ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Academies',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case '/signup':
            return MaterialPageRoute(builder: (context) => const SignupPage());
          case '/book':
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => CourseContentPage(
                topicSubtitle: args['topicSubtitle']!,
                topicContent: args['topicContent']!,
              ),
            );
          case '/home':
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => BottomNavBar(
                firstName: args['firstName'] ?? 'Guest',
                avatarUrl: args['avatarUrl'] ?? ''
              ),
            );
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}

class CourseContentPage extends StatelessWidget {
  final String topicSubtitle;
  final String topicContent;

  const CourseContentPage({
    required this.topicSubtitle,
    required this.topicContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuestionAnswerPage(topicContent: topicContent),
            ),
          );
        },
        backgroundColor: Colors.greenAccent,
        label: const Text('Generate Questions'),
        icon: const Icon(Icons.quiz),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.9),
          child: Column(
            children: [
              BioticSubtitleText(text: topicSubtitle),
              BioticBodyText(text: topicContent),
            ],
          ),
        ),
      ),
    );
  }
}
