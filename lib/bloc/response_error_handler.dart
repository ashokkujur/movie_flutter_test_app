class ResponseErrorHandler {
  dynamic errorMessage(int statusCode, {String? message}) {
    switch (statusCode) {
      case 400:
        return {"code": 400, "message": message ?? "Bad request error"};
      case 401:
        return {"code": 401, "message": "Email id or password is not valid"};
      case 403:
        return {"code": 403, "message": "Forbidden from accessing a valid URL"};
      case 404:
        return {"code": 400, "message": "Bad request response"};
      case 500:
        return {"code": 500, "message": "Internal server error"};
      default:
        return {"code": 87, "message": "Unexpected error"};
    }
  }
}
