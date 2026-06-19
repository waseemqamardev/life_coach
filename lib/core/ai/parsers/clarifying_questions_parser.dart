import '../../../data/models/ai/clarifying_question.dart';
import '../../../data/models/decision_input.dart';
import '../../errors/ai_exception.dart';
import 'json_response_parser.dart';

class ClarifyingQuestionsParser {
  ClarifyingQuestionsParser._();

  static List<ClarifyingQuestion> parse(String raw) {
    final Map<String, dynamic> json = JsonResponseParser.parseObject(raw);
    final List<dynamic> items =
        json['questions'] as List<dynamic>? ?? const <dynamic>[];

    final List<ClarifyingQuestion> questions = items
        .whereType<Map>()
        .map(
          (Map<dynamic, dynamic> item) =>
              ClarifyingQuestion.fromJson(item.cast<String, dynamic>()),
        )
        .where((ClarifyingQuestion q) =>
            q.question.isNotEmpty && q.options.length >= 3)
        .toList();

    if (questions.length < 3) {
      throw const AiParseException('Not enough valid clarifying questions.');
    }

    return questions.take(6).toList();
  }

  /// Contextual offline fallback when Gemini is unavailable.
  static List<ClarifyingQuestion> fallback(DecisionInput input) {
    final String topic = input.title.isNotEmpty
        ? input.title
        : (input.problemStatement.isNotEmpty
            ? input.problemStatement
            : 'this decision');
    final String shortTopic =
        topic.length > 60 ? '${topic.substring(0, 57)}…' : topic;
    final String optionA =
        input.options.isNotEmpty ? input.options.first : 'Option A';
    final String optionB =
        input.options.length > 1 ? input.options[1] : 'Option B';
    final String goalHint =
        input.goals.isNotEmpty ? input.goals : 'your stated goals';

    return <ClarifyingQuestion>[
      ClarifyingQuestion(
        question:
            'For "$shortTopic", what matters most when choosing between $optionA and $optionB?',
        options: <String>[
          'Long-term impact',
          'Immediate results',
          'Financial outcome',
          'Personal fulfillment',
        ],
      ),
      ClarifyingQuestion(
        question:
            'Which constraint is most likely to affect your decision about $shortTopic?',
        options: _constraintOptions(input),
      ),
      ClarifyingQuestion(
        question:
            'If you pick the safer path, what would you worry about missing?',
        options: <String>[
          'Growth opportunities',
          'Financial upside',
          'Personal satisfaction',
          'Time saved now',
        ],
      ),
      ClarifyingQuestion(
        question: 'How does this decision connect to $goalHint?',
        options: <String>[
          'It directly advances them',
          'It partially supports them',
          'It conflicts with them',
          'Goals still unclear',
        ],
      ),
      ClarifyingQuestion(
        question:
            'What would make you feel confident you chose well for $shortTopic?',
        options: <String>[
          'Clear measurable results',
          'Reduced stress or risk',
          'Alignment with values',
          'Support from others',
        ],
      ),
    ];
  }

  static List<String> _constraintOptions(DecisionInput input) {
    final List<String> options = <String>[];
    if (input.budget > 0) options.add('Budget limits');
    if (input.timeAvailability.isNotEmpty) {
      options.add('Limited time');
    }
    if (input.riskTolerance.isNotEmpty) options.add('Risk tolerance');
    if (input.experienceLevel.isNotEmpty) options.add('Experience level');
    if (input.urgency.isNotEmpty) options.add('Urgency timeline');

    const List<String> defaults = <String>[
      'Time',
      'Money',
      'Knowledge',
      'Support from others',
    ];
    for (final String item in defaults) {
      if (options.length >= 4) break;
      if (!options.contains(item)) options.add(item);
    }
    return options.take(4).toList();
  }
}
