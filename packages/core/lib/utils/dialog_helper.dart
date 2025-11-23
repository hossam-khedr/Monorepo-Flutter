import 'package:flutter/material.dart';
import 'package:theme/theming/custom_theme_extension.dart';

class DialogHelper {
  // Success Dialog
  static Future<void> success(
    BuildContext context, {
    required String message,
    String? title,
    String buttonText = 'حسناً',
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    final theme = context.dialogTheme;
    return _showCustomDialog(
      context,
      type: DialogType.success,
      title: title ?? 'نجح!',
      message: message,
      icon: Icons.check_circle,
      color: theme.successColor,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Error Dialog
  static Future<void> error(
    BuildContext context, {
    required String message,
    String? title,
    String buttonText = 'حسناً',
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    final theme = context.dialogTheme;
    return _showCustomDialog(
      context,
      type: DialogType.error,
      title: title ?? 'خطأ!',
      message: message,
      icon: Icons.error,
      color: theme.errorColor,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Warning Dialog
  static Future<void> warning(
    BuildContext context, {
    required String message,
    String? title,
    String buttonText = 'فهمت',
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    final theme = context.dialogTheme;
    return _showCustomDialog(
      context,
      type: DialogType.warning,
      title: title ?? 'تحذير!',
      message: message,
      icon: Icons.warning_amber,
      color: theme.warningColor,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Info Dialog
  static Future<void> info(
    BuildContext context, {
    required String message,
    String? title,
    String buttonText = 'حسناً',
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    final theme = context.dialogTheme;
    return _showCustomDialog(
      context,
      type: DialogType.info,
      title: title ?? 'معلومة',
      message: message,
      icon: Icons.info,
      color: theme.infoColor,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Confirm Dialog
  static Future<bool> confirm(
    BuildContext context, {
    required String message,
    String? title,
    String confirmText = 'تأكيد',
    String cancelText = 'إلغاء',
    Color? confirmColor,
    Color? cancelColor,
    bool barrierDismissible = true,
  }) async {
    final theme = context.dialogTheme;
    final result = await showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => _ConfirmDialog(
        title: title ?? 'تأكيد العملية',
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmColor: confirmColor ?? theme.infoColor,
        cancelColor: cancelColor ?? Colors.grey[700]!,
      ),
    );
    return result ?? false;
  }

  // Custom Dialog
  static Future<void> custom(
    BuildContext context, {
    required String message,
    required String title,
    required IconData icon,
    required Color color,
    required String buttonText,
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    return _showCustomDialog(
      context,
      type: DialogType.custom,
      title: title,
      message: message,
      icon: icon,
      color: color,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Show Custom Dialog
  static Future<void> _showCustomDialog(
    BuildContext context, {
    required DialogType type,
    required String title,
    required String message,
    required IconData icon,
    required Color color,
    required String buttonText,
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => _CustomDialog(
        type: type,
        title: title,
        message: message,
        icon: icon,
        color: color,
        buttonText: buttonText,
        onConfirm: onConfirm,
      ),
    );
  }

  // Adaptive Dialog Method
  static Future<T?> showAdaptiveDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = false,
  }) {
    final theme = context.dialogTheme;
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: theme.barrierColor,
      builder: builder,
    );
  }

  // Loading Dialog
  static void showLoading(BuildContext context, {String? message}) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _LoadingDialog(message: message),
    );
  }

  // Dismiss Current Dialog
  static void dismiss(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  // Dismiss All Dialogs
  static void dismissAll(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

// Custom Dialog Widget with Theme Support
class _CustomDialog extends StatefulWidget {
  final DialogType type;
  final String title;
  final String message;
  final IconData icon;
  final Color color;
  final String buttonText;
  final VoidCallback? onConfirm;

  const _CustomDialog({
    required this.type,
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
    required this.buttonText,
    this.onConfirm,
  });

  @override
  State<_CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<_CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleConfirm() {
    Navigator.of(context).pop();
    widget.onConfirm?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.dialogTheme;

    return Semantics(
      label: '${widget.title} dialog',
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: theme.borderRadius),
            elevation: theme.elevation,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: theme.padding,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: theme.borderRadius,
                boxShadow: theme.boxShadow,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.icon,
                      size: theme.iconSize,
                      color: widget.color,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    widget.title,
                    style: theme.titleTextStyle.copyWith(color: widget.color),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Message
                  Text(
                    widget.message,
                    style: theme.messageTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.color,
                        foregroundColor: Colors.white,
                        padding: theme.buttonPadding,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        widget.buttonText,
                        style: theme.buttonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Confirm Dialog with Theme Support
class _ConfirmDialog extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final Color confirmColor;
  final Color cancelColor;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.confirmColor,
    required this.cancelColor,
  });

  @override
  State<_ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<_ConfirmDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleConfirm() => Navigator.of(context).pop(true);
  void _handleCancel() => Navigator.of(context).pop(false);

  @override
  Widget build(BuildContext context) {
    final theme = context.dialogTheme;

    return Semantics(
      label: '${widget.title} confirmation dialog',
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: theme.borderRadius),
            elevation: theme.elevation,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: theme.padding,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: theme.borderRadius,
                boxShadow: theme.boxShadow,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.confirmColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.help_outline,
                      size: theme.iconSize,
                      color: widget.confirmColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    widget.title,
                    style: theme.titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Message
                  Text(
                    widget.message,
                    style: theme.messageTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Buttons
                  Row(
                    children: [
                      // Cancel Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _handleCancel,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: widget.cancelColor,
                            side: BorderSide(
                              color: theme.backgroundColor == Colors.white
                                  ? Colors.grey[300]!
                                  : Colors.grey[600]!,
                            ),
                            padding: theme.buttonPadding,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            widget.cancelText,
                            style: theme.buttonTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Confirm Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _handleConfirm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.confirmColor,
                            foregroundColor: Colors.white,
                            padding: theme.buttonPadding,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            widget.confirmText,
                            style: theme.buttonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Loading Dialog with Theme Support
class _LoadingDialog extends StatelessWidget {
  final String? message;

  const _LoadingDialog({this.message});

  @override
  Widget build(BuildContext context) {
    final theme = context.dialogTheme;

    return PopScope(
      canPop: false,
      child: Semantics(
        label: 'Loading dialog',
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: theme.borderRadius),
          elevation: theme.elevation,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: theme.padding,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Loading Indicator
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(theme.infoColor),
                  ),
                ),

                // Message
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message!,
                    style: theme.messageTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
