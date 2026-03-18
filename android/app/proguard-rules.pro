# 1. Flutter / Dart (Standard Engine Protection)
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.runtime.v8.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugin.editing.** { *; }

# 2. Firebase & Google Services
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

# 3. Notification Services (OneSignal)
-keep class com.onesignal.** { *; }
-dontwarn com.onesignal.**

# 4. Auth & Messaging Specifics
-keep class com.google.android.gms.auth.api.signin.** { *; }
-dontwarn com.google.android.gms.auth.api.signin.**
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**

# 5. Payment Gateways (Crucial for Indian Gateways & Stripe)
-keep class com.phonepe.** { *; }
-keep class com.paytm.** { *; }
-keep class com.stripe.android.** { *; }
-dontwarn com.phonepe.**
-dontwarn com.paytm.**

# 6. General "Noisy" Warnings (Fixes build-time crashes)
-dontwarn okio.**
-dontwarn javax.annotation.**
-dontwarn com.squareup.okhttp.**
-dontwarn org.codehaus.mojo.animal_sniffer.**

