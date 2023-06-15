const authErrorStatusCode = 401;
const successStatusCode = 200;
const badRequestStatusCode = 400;
const serverErrorStatusCode = 500;

const devBaseUrl = "https://api.publicapisDev.org";
const qaBaseUrl = "https://api.publicapisProd.org";
const prodBaseUrl = "https://api.publicapisQA.org";
const localBaseUrl = "https://api.publicapisDev.org";

const accessToken = "Access Token";
const refreshToken = "Refresh Token";

const String noInternetConnection = "No Internet Connection";
const String somethingDoesWentWrong = "Something does went wrong";
const String serverError = "Server Error";
const String somethingWentWrong = "Something went wrong";
const String badResponseFormat = "Bad response format";

const String emailIdRegExp =
    r"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
const String passwordRegExp =
    "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{6,}\$";
