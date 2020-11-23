class ErrorHandler {

  static onError(e,_reqBody){
    _reqBody.request.response.statusCode = 400;
    _reqBody.request.response.write(e);
  }

}