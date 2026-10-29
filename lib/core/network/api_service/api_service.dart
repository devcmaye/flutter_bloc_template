import 'package:flutter_bloc_template/modules/template/data/models/requests/template_request.dart';
import 'package:flutter_bloc_template/modules/template/data/models/responses/template_response.dart';

import '../base_response/api_response.dart';

// ################# API Services ######################

abstract class ApiService {
  // Auth
  Future<TemplateResponse> callTemplate(TemplateRequest request);
}
