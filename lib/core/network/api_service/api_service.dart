import '../base_response/api_response.dart';

// ################# API Services ######################

abstract class ApiService {
  // Auth
  Future<TemplateResponse> callTemplate(TemplateRequest request);
}
