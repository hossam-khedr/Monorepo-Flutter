import 'package:core/utils/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: kIsWeb ? null : const Duration(seconds: 5),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(ApiInterceptor(dio));


    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (object) {
            debugPrint('🔷 API Log: $object');
          },
        ),
      );
    }
  }

  // GET Request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
    bool requiresAuth = true,
  }) async {
    try {
      final options = Options(
        headers: headers,
        extra: {'requiresAuth': requiresAuth}, // تمرير الـ flag
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await dio.get(
        url,
        queryParameters: query,
        options: options,
      );
      return response;
    } catch (error) {
      debugPrint('❌ GET Request Error: $error');
      rethrow;
    }
  }

  // POST Request
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
    bool requiresAuth = true, // إضافة flag
  }) async {
    try {
      final options = Options(
        headers: headers,
        extra: {'requiresAuth': requiresAuth}, // تمرير الـ flag
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await dio.post(
        url,
        data: data,
        queryParameters: query,
        options: options,
      );
      return response;
    } catch (error) {
      debugPrint('❌ POST Request Error: $error');
      rethrow;
    }
  }

  // PUT Request
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
    bool requiresAuth = true, // إضافة flag
  }) async {
    try {
      final options = Options(
        headers: headers,
        extra: {'requiresAuth': requiresAuth}, // تمرير الـ flag
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await dio.put(
        url,
        data: data,
        queryParameters: query,
        options: options,
      );
      return response;
    } catch (error) {
      debugPrint('❌ PUT Request Error: $error');
      rethrow;
    }
  }

  // DELETE Request
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
    bool requiresAuth = true, // إضافة flag
  }) async {
    try {
      final options = Options(
        headers: headers,
        extra: {'requiresAuth': requiresAuth}, // تمرير الـ flag
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await dio.delete(
        url,
        data: data,
        queryParameters: query,
        options: options,
      );
      return response;
    } catch (error) {
      debugPrint('❌ DELETE Request Error: $error');
      rethrow;
    }
  }

  // Upload File
  static Future<Response> uploadFile({
    required String url,
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? data,
    String? token,
    ProgressCallback? onSendProgress,
    bool requiresAuth = true, // إضافة flag
  }) async {
    try {
      final options = Options(
        extra: {'requiresAuth': requiresAuth}, // تمرير الـ flag
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      FormData formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
        if (data != null) ...data,
      });

      final response = await dio.post(
        url,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (error) {
      debugPrint('❌ Upload File Error: $error');
      rethrow;
    }
  }

  static void cancelAllRequests() {
    dio.close();
  }
}

// ============================================
// API Interceptor with Token Refresh
// ============================================
class ApiInterceptor extends Interceptor {
  final Dio _dio;

  ApiInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('🔵 Request: ${options.method} ${options.uri}');

    // إضافة التوكن فقط إذا لم يكن موجود في الـ headers بالفعل
    // وإذا كان الطلب يحتاج مصادقة (requiresAuth flag)
    if (!options.headers.containsKey('Authorization')) {
      // التحقق من الـ flag (افتراضياً true)
      final requiresAuth = options.extra['requiresAuth'] ?? true;

      if (requiresAuth) {
        final token = TokenManager().token;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      '✅ Response: ${response.statusCode} ${response.requestOptions.uri}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('❌ Error: ${err.response?.statusCode} ${err.requestOptions.uri}');

    // معالجة خطأ 401 (Unauthorized)
    if (err.response?.statusCode == 401) {

      final isRefreshRequest = err.requestOptions.path.contains('refresh') ||
          err.requestOptions.path.contains(ApiConstants.refreshEndpoint);

      if (isRefreshRequest) {
        debugPrint('❌ Refresh token expired - redirecting to login');
        await _handleAuthFailure();
        return handler.reject(err);
      }
      final tokenManager = TokenManager();

      // التحقق من وجود token
      if (tokenManager.token != null) {
        try {
          debugPrint('🔄 Attempting to refresh token...');

          // محاولة تحديث التوكن
          final newToken = await tokenManager.refreshToken();

          if (newToken != null) {
            debugPrint('✅ Token refreshed successfully');

            // إعادة محاولة الطلب بالتوكن الجديد
            final requestOptions = err.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newToken';

            // إعادة الطلب
            final response = await _dio.fetch(requestOptions);
            return handler.resolve(response);
          } else {
            // فشل تحديث التوكن
            debugPrint('❌ Token refresh failed');
            await _handleAuthFailure();
            return handler.reject(err);
          }
        } catch (e) {
          // خطأ في تحديث التوكن
          debugPrint('❌ Error refreshing token: $e');
          await _handleAuthFailure();
          return handler.reject(err);
        }
      } else {
        // لا يوجد token
        debugPrint('❌ No token found');
        await _handleAuthFailure();
        return handler.reject(err);
      }
    }

    // معالجة باقي أنواع الأخطاء
    _handleDioException(err);

    super.onError(err, handler);
  }

  void _handleDioException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        debugPrint('⏱️ Connection Timeout Error');
        break;
      case DioExceptionType.sendTimeout:
        debugPrint('⏱️ Send Timeout Error');
        break;
      case DioExceptionType.receiveTimeout:
        debugPrint('⏱️ Receive Timeout Error');
        break;
      case DioExceptionType.badResponse:
        _handleBadResponse(err);
        break;
      case DioExceptionType.cancel:
        debugPrint('🚫 Request was cancelled');
        break;
      case DioExceptionType.unknown:
        debugPrint('🌐 Network Error - Check your internet connection');
        break;
      case DioExceptionType.badCertificate:
        debugPrint('🔒 Certificate Error');
        break;
      case DioExceptionType.connectionError:
        debugPrint('🌐 Connection Error');
        break;
    }
  }

  void _handleBadResponse(DioException err) {
    switch (err.response?.statusCode) {
      case 400:
        debugPrint('❌ Bad Request - البيانات غير صحيحة');
        break;
      case 401:
        debugPrint('🔐 Unauthorized - غير مصرح له');
        break;
      case 403:
        debugPrint('🚫 Forbidden - ممنوع الوصول');
        break;
      case 404:
        debugPrint('🔍 Not Found - غير موجود');
        break;
      case 500:
        debugPrint('💥 Internal Server Error - خطأ في الخادم');
        break;
      case 503:
        debugPrint('⚠️ Service Unavailable - الخدمة غير متاحة');
        break;
      default:
        debugPrint('❌ Error: ${err.response?.statusCode}');
    }
  }

  Future<void> _handleAuthFailure() async {
    await TokenManager().clearToken();
    // يمكنك هنا توجيه المستخدم لصفحة تسجيل الدخول
    // مثال: navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
  }
}

