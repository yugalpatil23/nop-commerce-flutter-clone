class ContactUsService {
  Future<bool> submitContactUs(
    String name,
    String email,
    String enquiry,
  ) async {
    await Future.delayed(const Duration(seconds: 3));

    return false;
  }
}
