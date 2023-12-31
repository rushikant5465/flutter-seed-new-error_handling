## Flutter Seed

This seed has been created keeping best practices and conventions in mind to be followed for Flutter.

---

## Items in this seed

*    [X]  Basic app with the **recommended folder structure** and a non-functional login page.
*    [X]  Internationalization
*    [X]  API calls - Integrate the login API, Common place for routes
*    [X]  JWT Tokens - Authentication and Authorization with JWT tokens
*    [ ]  Auto logout vs stay logged in options
*   [X] Error handling, Exception handling, Logging
*    [X]  Theming - ability to switch between light and dark theme
*    [X]  Linting with dart analyze
*   [X] Integration with dart metrics
*    [ ]  Dashboard screen to showcase other basic widgets and containers with responsive design
*   [ ] State management with BLOC
*   [X] JSON validation and working with JSONs
*   [ ] Navigator 2.0 (advanced navigation)
*    [X]  Environment-specific configuration
*   [ ] Writing unit test cases
*   [ ] Versioning of releases
*   [ ] Notifications
*   [ ] Database usage
*   [ ] Asynchronous programming
*   [ ] How to use switch between Material and Cupertino depending on the platform the app is running on
*   [ ] Deployments
*   [ ] CI-CD
*   [ ] POC - Amplify Flutter
*   [ ] Generating docs from code using dart doc
*   [ ] Animations
*   [X] Integrate with Indexnine Sonarqube Server
*   [X] Placing assets path in constants file and use it from there in the files
*   [X] Placing colors, typography from a common place
---

## Basic app with the recommended folder

# For the creation of app we use command:
   **flutter create my_app_name**

### Default files and folders in a Flutter project.

android: The Android folder contains files and folders required for running the application on an Android operating system. These files and folders are autogenerated during the creation of the flutter project.

ios: This folder contains files required by the application to run the dart code on iOS platforms.

linux: This folder contains files and folders that is required by the application to run the dart code on linux platforms.

macos: This folder contains files and folders that is required by the application to run the dart code on macOS platforms.

web: This folder contains files and folders that is required by the application to run the dart code on web browsers.

test: This folders contains the test we write for wigets, features etc.

pubspec.yaml: This is the file we use to add metadata and configuration specific to our application. With this file’s help, we can configure dependencies such as image assets, fonts, and app versions. This file is also used to install third party modules in our applicaton.

pubspecam.lock: This file contains the version of each dependency and packages used in the flutter application.

.gitignore: The gitignore file store files are hidden from the IDE, which needs to be ignored when a project is uploaded to version control platforms like GitHub.

.metadata: Like the .gitignore, this file is also hidden. It contains metadata required by the flutter tool to track the flutter project.

.packages: Packages file contains the path to every package and library used in the project. 

lib: lib is the most important folder in the project, used to write most of the dart code. By default, the lib folder contains the main.dart file, which is the application’s entry point.

## Step to upgrade flutter version

-  Run '**flutter upgrade**' command on terminal
-  specify the flutter version number in **pubspec.yaml** file under environment.
-  Run *flutter pub get** to get latest dependency with respect to version

### The basic folder structure  in lib is as follows:

1. lib
    - common_widgets
    - common_models
    - config
    - constant_string
    - utils
    - views
        - feature_1
            - blocs
            - models
            - screens
            - services
            - widgets

1. common_widgets: Common widgets folders will contain commonly used widgets like loading indicators, dialogs, and any widget we use frequently on your modules.

2. common_models: A model represents exactly what data we expect to both receive from the external API's. common_models folder contains the models that is used frequently in the application at different places.

3. config: Config folder contains the configuration of application like routes, themes etc.

4. constant_strings: Constant strings folder contains all tha constants that will be used in our application.

5. utils: Utils folder contains helper functions that will be used frequently. It can also be used to have a setup for making API calls.

6. views: Views folder is the UI part of the application.It contains feture specific folders, like authentication, dashboard, profile etc.These folders consists of models, screens, services, widgets. 
    - models: These models are feature specific that will only be used in that feature.
    - screens: screens folder has screens or pages that will be displayed in UI.
    - widgets: Screen is made up of many widgets. Feature specific widgets are placed here.
    - services: Functions for server or API calls are placed here.
    - blocs: Bloc is used for state management in flutter. It contains state, events and bloc folders. 
 
## Basic Login Page

1. The Custom Card widget that we have created is used in login Page. All the content of login page is inside this Custom Card.

2. Login page includes two input feilds. Email input field and Password input field, For input fields **TextField()** widget is used.

3. Login page includes a button with title of 'Login'. Right now onClick is handled by a null function. For login button **ElevatedButton()** widget is used.

## Internationalization

# For adding internationalization feature in our flutter application we have to follow below mentioned steps:

1. In pubspec.yaml file inside **dependecies** section add 

    - flutter_localizations:
        sdk: flutter
    - intl: ^0.17.0

    inside pubspec.yaml file in section that is specific to Flutter add 

    - generate: true

2. Add a new file with name **l10n.yaml** to the root directory of the project. Add the below code in the newly created file.

    arb-dir: lib/l10n
    template-arb-file: app_en.arb
    output-localization-file: app_localizations.dart

3. Inside **lib** folder create a new folder with name **l10n**. Inside the newly created folder we add a file that provides the template, The file is named with convention **app_en.arb** for English template. If the app needs to be translated in some other language than English say, Spanish than we create another file with same naming convention **app_es.arb** (es for Spanish) this file will contain template in Spanish.

    - lib/l10n/app_en.arb
        {
            "helloWorld": "Hello World!",
        }

    - lib/l10n/app_es.arb
        {
            "helloWorld": "¡Hola Mundo!",
        }

4. In **l10n** folder add a file naming **l_10n.dart**. This file will contain all the languages supported by our application. Add the below code snippet in the newly created file.

    import 'package:flutter/material.dart';

    class L10n {
        static final all = [
            const Locale('en'),
            const Locale('es'),
        ];
    }

5. Now run the following command: **flutter gen-l10n**. This commands generates the code that will be used by the application to show content in different languages. The code genrated can be found at .dat_tools/flutter_gen/gen_l10n.

6. Now we need to make changes in main.dart, so our application can use the templates that we created to show the content.

    - First import 'package:flutter_gen/gen_l10n/app_localizations.dart';

    - In **MaterialApp()** constructor add localizationsDelegates prop:
        localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
        ],
    - In **MaterialApp()** constructor add another prop called supportedLocales:
        - supportedLocales: L10n.all,

    - In **MaterialApp()** constructor a prop naming locale is used to instruct the app, In which language the user want to see the   content of the application. Add locale prop in the MaterialApp().

        - locale: const Locale('en', 'US'),

7. To use internationalizaton in our application's page/screen/widgets we have to follow a convention: 

    ***AppLocalizations.of(context)!.{keyOfTheText}***

    In lib/views/hello_world.dart
    
    - First, import 'package:flutter_gen/gen_l10n/app_localizations.dart';

    - **Text(AppLocalizations.of(context)!.helloWorld)**

## API calls

details here

## Theming - ability to switch between light and dark theme

1. To Set default theme
   -  change the themeMode variable in theme_provider.dart file
   -  Three modes are available. 
      - System - Use either the light or dark theme based on what the user has selected in the system settings.
      - Light
      - Dark

2. Manual Theme Change Procedure
   -  Initaialize a themeProvider variable inside widget
      -  final themeProvider = Provider.of<ThemeProvider>(context);
   -  Create a function 
      -  changeTheme(state) {
         -   final provider = Provider.of<ThemeProvider>(context, listen: false);
         -   provider.toggleTheme(state);
         }
   -  Call the function with respective parameter
      -  for Example  : onPressed: () {changeTheme(!themeProvider.isDarkMode);  }
                    
##  Environment-specific configuration

1. To run a code with specific environment

   - flutter run --dart-define=ENVIRONMENT=DEV
   - flutter run --dart-define=ENVIRONMENT=PROD
   - flutter run --dart-define=ENVIRONMENT=QA

2. To build apk run with specific environment

   - flutter build --dart-define=ENVIRONMENT=DEV
   - flutter build --dart-define=ENVIRONMENT=PROD
   - flutter build --dart-define=ENVIRONMENT=QA

3. To get base URL base on environment use this function

   -  Environment().config.baseUrl,

4. Note: This feature implementation done in three file
   -  **main.dart**: Here we read data form command which is fire to run/build application, we extract data from ENVIRONMENT key vie fromEnvironment() function(flutter inbuild function) and pass it to environment file to initialize variable.
   - **environment.dart** : Different enviroments are define here also This is the primary class from which the environment url is obtained vie config variable.
   - **base_config.dart** : BaseConfig class is formed here, and its variable values are re-initialized based on the inheritance classes. 


##  Mock Environment configuration

1. To run and build application with mock environment

   - flutter build --dart-define=MOCK=true
   - flutter build --dart-define=MOCK=true

2. Note: Files consider for implementation
   -  **environment.dart**: Here we read data from the command, which is fire to run/build application, we extract data from MOCK key vie fromEnvironment() function(flutter inbuild function) and initialize **mockEnvironment** variable.
   - **http_service.dart** : mock_intercepter file is get added to http_service based on mockEnvironment flag
   - **mock_intercepter.dart** :When an API request, event occurs in this file, then we check to see if the endpoint is present in the **mock.config.dart** file, then we create an HTTP response object and return to the url request.
   - To **add new JSON for mock** api, add that file in **Mock folder**, mention that route in **pubspec.yaml** file under flutter-assets and add endpoint in **mock.config.dart** file
   

## Http headers with respect to service

1. To append new headers make a httpService.appendNewHeader(header) function call from respective service file.
2. To overwrite headers make a httpService.overwriteHeaders(header) function call from respective service file.

#  Integrate with Indexnine Sonarqube Server
   
1. Connect with **Indexnine** Sonarqube is not possible because the flutter community has not yet supported it, but we can run sonar analysis locally.
2. Step to run sonar analysis
   -  prerequisites-and-overview:  https://docs.sonarqube.org/latest/requirements/prerequisites-and-overview/
   -  download sonarqube community version from here  https://www.sonarsource.com/products/sonarqube/downloads/
   -  extract above downloads and navigate to bin bin/windows-x86-64 folder and run StartSonar.bat file
   -  once file run, got to localhost:9000 and create new account follow by creating new project manually,
   -  Follow the further instruction mention on same page, and copy token, neme and replace them in sonar-project.properties file
   - visit https://github.com/insideapp-oss/sonar-flutter and follow installation and project configuartion steps. 
   - Open commond promt and start sonar analysis by this commond
   -  -  flutter analyze --no-fatal-infos --no-fatal-warnings   
   - resolve error if exist then,
   -  - sonar-scanner.bat -D"sonar.projectKey=sonar_report_run" -D"sonar.sources=."  
   - More step by step detailed are explained here  https://www.youtube.com/watch?v=QD5J8YvQPPM&t=780s


 #Error handling, Exception handling, Logging
 
1.  talker_flutter and talker_dio_logger dependency added for this : h  
1. Error handling & Exception handling
   - Check **main.dart** file 
   - runZonedGuarded is added in main function. Basically, if an error occurs synchronously in [body], then throwing in the [onError] handler causes the call to 'runZonedGuarded' to throw that error; otherwise, the call to 'runZonedGuarded' returns 'null'. and we log this error vie talker

2. API Error 
   - _dio.interceptors.add(GetIt.instance<TalkerDioLogger>()) interceptor is added in http_service.dart
   - and  In every API call add  GetIt.instance<Talker>().handle(e); in error function like try {} catch (e) {  GetIt.instance<Talker>().handle(e); }
   - This will log the error on console in readble format check user_goal_service.dart file

3. More example can be found here: https://dev.to/frezyx/showing-flutter-custom-error-messages-109o, https://pub.dev/packages/talker


# Linting with dart analyze

1. All lint rule are mention here 
   -  https://dart-lang.github.io/linter/lints/index.html
2. All rules are mention in analysis_options.yaml file
3. To add new rule: list it under lint rule in analysis_options.yaml file
4. to run analysis use this command : flutter analyze --no-fatal-infos --no-fatal-warnings

# Integration with dart metrics

1. All dart metrics rule are mention here
   -  https://dartcodemetrics.dev/docs/rules
2. All rules are mention in analysis_options.yaml file
3. To add new rule: list it under dart_code_metrics rule in analysis_options.yaml file
4. to run analysis use this command : flutter analyze --no-fatal-infos --no-fatal-warnings


#JSON validation and working with JSONs

1. to use json_annotation in modal create a class and annotate the class with @JsonSerializable()  for example
 
      import 'package:json_annotation/json_annotation.dart';
      part 'user.g.dart';
      @JsonSerializable()
      class User {
          final String name;
          final String surname;
          final int age;
          User({this.name, this.surname, this.age});
          factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
         Map<String, dynamic> toJson() => _$UserToJson(this);
      }

3. use respective annotation as per use case
   -  @JsonKey(required: true)
   -  @JsonKey(disallowNullValue: true)
   -  @JsonKey(defaultValue: false)
   -  @JsonKey(name: 'current_address')
   -  @JsonKey(fromJson: _convertTobool)
   
2. Using the json_annotation is a two step process. You have to annotate your models, and then you have to run
**flutter packages pub run build_runner build**

3 Ref link: 
   -  https://medium.com/flutter-community/generate-the-code-to-parse-your-json-in-flutter-c68aa89a81d9
   -  https://medium.com/codechai/validating-json-in-flutter-6f07ec9344f8

4. Parse response like
 try {
      response = await httpService.request(
        url: Urls().hotels,
        method: Method.get,
      );// handle API time out
      return SampleModel.fromJson(json.decode(response.data));
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
