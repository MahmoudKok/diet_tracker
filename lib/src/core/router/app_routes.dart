abstract class AppRoutes {
  static const String splash = "/";
  static const String announcements = "/announcements";
  static const String announcementDetails = "/announcement-details";

  static const String certificatesCurriculums = "/certificates-curriculums";
  static const String certificateDetails = "/certificate-details";

  static const String coursesCurriculums = "/courses-curriculums";
  static const String courseDetails = "/courses/:courseId";

  static const String privacyPolicy = "/privacy-policy";
  static const String termsConditions = "/terms-and-conditions";

  static const String courseContent = "/courses/:courseId/content";
  static const String courseUnits = "/courses/:courseId/units";
  static const String videoTopic = "/courses/:courseId/topics/:topicId";

  static const String examOptions = "/courses/:courseId/exams";
  static const String examMcqsBank = "/courses/:courseId/exams/mcqs-bank";
  static const String examEssaysBank = "/courses/:courseId/exams/essays-bank";
  static const String examResult = "/courses/:courseId/exams/result";
  static const String examLog = "/courses/:courseId/exams/log";

  static const String honoredStudents = "/honored-students";

  static const String settings = "/settings";
  static const String faqs = "/faqs";
  static const String languages = "/languages";

  static const String onBoarding = "/on-boarding";

  static const String signIn = "/auth/sign-in";
  static const String signUp = "/auth/sign-up";
  static const String otp = "/auth/otp";
  static const String verifyAccount = "/auth/verify-account";
  static const String forgetPassword = "/auth/forgot-password";
  static const String resetPasswordLink = "/auth/reset-password";

  static const String profile = "/profile";
  static const String editProfile = "/profile/edit";
  static const String notifications = "/notifications";
  static const String subscriptions = "/subscriptions";

  static const String home = "/home";
  static const String learn = "/learn";
}
