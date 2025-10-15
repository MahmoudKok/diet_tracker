class ApiEndpoints {
  const ApiEndpoints._();

  // ===== public / Course =====
  static const String oneDayCourses = "courses/oneday";
  static const String getCourseDetails = "course/details/{courseId}";
  static const String getCourseInstructors = "public/instructors";
  static const String getCourseSuccessStories = "public/success_stories";
  // ===== public / Certificate =====
  static const String allCertificates = "certificates/all";
  static const String getCoursesByCertificate =
      "courses/certificate/{certificateId}";
  static const String getCoursePackages = "supscription/packages";
  static const String certificateCategory =
      "public/supscription/package/category";
  static const String getPackageDetails =
      "supscription/features/package/{packageId}";
  static const String getCertificateInstructors = "public/instructors";
  static const String getCertificateSuccessStories = "public/success_stories";
  // ===== public =====
  static const String popupNews = "public/popup-news";
  static const String countries = "countries/all";
  static const String news = "public/news";
  static const String calendar = "public/calendar/courses";
  static const String coursesCount = "student/stats/courses/count";
  static const String studentsCount = "student/stats/students/count";
  static const String certificatesCount = "student/stats/certificates/count";
  static const String successStoriesCount =
      "student/stats/success-stories/count";
  static const String honorList = "public/honors";
  static const String contactUs = "contactus/message/send";
  static const String faqs = "public/faqs";
  // ===== Settings =====
  // ===== General =====
  static const String privacy = "public/setting/PRIVACY_POLICY/value";
  static const String termsAndConditions =
      "public/setting/TERMS_CONDITIONS/value";
  // ===== Auth =====
  static const String firebase = "0aOEWMo/77R9/6DdxA/8wVhNp";
  static const String iplocation = "json/";
  static const String login = "auth/login";
  static const String logout = "auth/logout";
  static const String signup = "auth/signup";
  static const String activate = "auth/account/activate";
  static const String resendActivationCode =
      "auth/account/activate/code/resend";
  static const String forgotPassword =
      "auth/account/resetpassword/code/{email}";
  static const String resetPassword = "auth/reset-password";
  static const String isLoggedIn = "auth/is_loggedin";
  static const String googleAuth = "auth/oauth2/google/login";
  static const String appleAuth = "auth/oauth2/apple/login";
  static const String updateProfile = "user/profile/update";
  // ===== Mobile Controller =====
  static const String getVersion = "items/mobile_app_versions";
  static const String contactNumber = "items/contact_numbers";
  // ===== Exams / Essay =====
  static const String ongoing = "student/round/exam/{examId}/ongoing";
  static const String stats = "student/questions/stats";
  static const String start = "student/round/exam/start";
  static const String examQuestions =
      "student/round/exam/questions/{examRoundId}";
  static const String questionCorrection =
      "student/round/question/answer/correction";
  static const String questionAnswer = "student/round/question/answer";
  // ===== Exams =====
  static const String courseExamLog =
      "student/round/exam/finished/course/{courseId}";
  static const String coursesExams =
      "student/exams/subscribed/course/{courseId}";
  static const String ongoingGet = "student/round/exam/{examId}/ongoing";
  static const String statsGet = "student/questions/stats";
  static const String startPost = "student/round/exam/start";
  static const String examQuestionsGet =
      "student/round/exam/questions/{examRoundId}";
  static const String questionOptions = "student/question/{questionId}/options";
  static const String questionAnswerPost = "student/round/question/answer";
  static const String questionCorrectionPost =
      "student/round/question/answer/correction";
  static const String finish = "student/round/exam/finish";
  static const String flagQuestion = "student/round/question/flag";
  static const String questionTranslate = "student/round/exam/questions/447381";
  static const String favoriteQuestion = "student/question/fav";
  static const String pauseExamTimer = "student/round/exam/pause";
  static const String reportQuestion = "student/issue_report";
  static const String finishExamReport =
      "student/performance/round/exam/{examRoundId}";
  static const String retryExam = "student/round/exam/retry";
  static const String examReview = "student/round/exam/finished/course/18";
  // ===== General =====
  static const String notifications = "user/notifications";
  static const String notificationsRead = "user/notifications/read";
  static const String studentCoursesSubscribed = "student/courses/subscribed";
  static const String studentCourseIdContent =
      "student/course/{courseId}/content";
  static const String studentExamsSubscribedCourseId =
      "student/exams/subscribed/course/{courseId}";
  static const String videoNotes = "student/video-notes/{videoId}";
  static const String videoStreamStart =
      "fs/video/hls/1688149053623_bandicam%202023-02-15%2012-19-53-349/index.m3u8";
  static const String videoStreamPart =
      "fs/video/hls/1688149053623_bandicam%202023-02-15%2012-19-53-349/index0.ts";
  static const String videoReaction = "student/reaction";
  static const String reportVideo = "student/issue_report";
  static const String addVideoNote = "student/video-note/{videoId}";
  static const String subscribeToCourse = "student/subscribe";
  static const String deleteAccount = "user/profile";
  static const String videoStart = "student/round/lecture/start";
  static const String videoProgress = "student/round/lecture/progress";
  static const String coursesPerformance = "student/performance/courses";

  // ===== Home =====
  static const String announcements = "home/announcements";
  static const String certificates = "home/certificates";

  // ===== Learn =====
  static const String learnData = "learn/data";

  // ===== My Courses =====
  static const String myCourses = "my-courses/data";

  // ===== Community =====
  static const String communityPosts = "community/posts";

  // ===== Learning GO =====
  static const String learningGoData = "learning-go/data";
}
