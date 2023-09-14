import 'package:seedapp/app/core/animations/animations.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationsUtils {
  static get startMap => {
        'imageOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 50.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 150.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 150.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 150.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 300.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation3': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 400.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'buttonOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 550.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 550.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 550.ms,
              duration: 900.ms,
              begin: const Offset(-79.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'rowOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 650.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: const Offset(-74.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'imageOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 50.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation4': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 300.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation5': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 400.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'rowOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 650.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: const Offset(-74.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'imageOnPageLoadAnimation3': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 50.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 50.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation6': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 300.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 300.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'textOnPageLoadAnimation7': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 400.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 400.ms,
              duration: 900.ms,
              begin: const Offset(71.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'buttonOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 550.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 550.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 550.ms,
              duration: 900.ms,
              begin: const Offset(-79.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'rowOnPageLoadAnimation3': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 650.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 650.ms,
              duration: 600.ms,
              begin: const Offset(-74.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'iconButtonOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 600.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: const Offset(66.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'iconButtonOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 600.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.easeInOut,
              delay: 600.ms,
              duration: 600.ms,
              begin: const Offset(-51.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
      };

  static get homeMap => {
        'imageOnPageLoadAnimation': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 1.ms),
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 0.ms,
              duration: 1000.ms,
              begin: 0.0,
              end: 1.0,
            ),
          ],
        ),
        'containerOnPageLoadAnimation1': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 200.ms),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 200.ms,
              duration: 1100.ms,
              begin: const Offset(0.0, -75.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'iconButtonOnPageLoadAnimation': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 350.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 350.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 350.ms,
              duration: 900.ms,
              begin: const Offset(-79.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'buttonOnPageLoadAnimation': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          effects: [
            VisibilityEffect(duration: 450.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 450.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 450.ms,
              duration: 900.ms,
              begin: const Offset(-79.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
        'containerOnActionTriggerAnimation': AnimationInfo(
          trigger: AnimationTrigger.onActionTrigger,
          applyInitialState: false,
          effects: [
            MoveEffect(
              curve: Curves.easeOut,
              delay: 0.ms,
              duration: 700.ms,
              begin: const Offset(0.0, 0.0),
              end: const Offset(0.0, -100.0),
            ),
          ],
        ),
        'containerOnPageLoadAnimation2': AnimationInfo(
          trigger: AnimationTrigger.onPageLoad,
          applyInitialState: false,
          effects: [
            VisibilityEffect(duration: 100.ms),
            FadeEffect(
              curve: Curves.elasticOut,
              delay: 100.ms,
              duration: 900.ms,
              begin: 0.0,
              end: 1.0,
            ),
            MoveEffect(
              curve: Curves.elasticOut,
              delay: 100.ms,
              duration: 900.ms,
              begin: const Offset(0.0, -60.0),
              end: const Offset(0.0, 0.0),
            ),
          ],
        ),
      };
}
