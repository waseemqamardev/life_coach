/// Typed failures for Gemini and AI parsing layers.
sealed class AiException implements Exception {
  const AiException(this.message, {this.code});
  final String message;
  final String? code;

  @override
  String toString() => message;

  String get userMessage => message;
}

final class AiMissingApiKeyException extends AiException {
  const AiMissingApiKeyException()
      : super(
          'GEMINI_API_KEY is missing. Add it to .env and restart the app.',
          code: 'missing_api_key',
        );
}

final class AiNetworkException extends AiException {
  const AiNetworkException([String? detail])
      : super(
          detail ?? 'Network error. Check your internet connection and try again.',
          code: 'network',
        );
}

final class AiTimeoutException extends AiException {
  const AiTimeoutException()
      : super('The AI request timed out. Please try again.', code: 'timeout');
}

final class AiRateLimitException extends AiException {
  const AiRateLimitException()
      : super(
          'Too many requests. Please wait a moment and try again.',
          code: 'rate_limit',
        );
}

final class AiEmptyResponseException extends AiException {
  const AiEmptyResponseException()
      : super('The AI returned an empty response.', code: 'empty_response');
}

final class AiParseException extends AiException {
  const AiParseException([String? detail])
      : super(
          detail ?? 'Could not parse the AI response.',
          code: 'parse_error',
        );
}

final class AiModelUnavailableException extends AiException {
  const AiModelUnavailableException(String model)
      : super('Model $model is unavailable.', code: 'model_unavailable');
}

final class AiUnknownException extends AiException {
  const AiUnknownException(Object error)
      : super('Analysis failed: $error', code: 'unknown');
}
