#########################################
# 1. Flutter / Dart (Standard Engine Protection)
#########################################
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.runtime.v8.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugin.editing.** { *; }

#########################################
# 2. Firebase & Google Services
#########################################
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**
-keep class com.google.firebase.components.** { *; }
-keep class com.google.firebase.iid.** { *; }
-keep class com.google.firebase.crashlytics.** { *; }
-keep class com.google.firebase.auth.** { *; }
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**
-keep class com.google.android.gms.auth.api.signin.** { *; }
-dontwarn com.google.android.gms.auth.api.signin.**

#########################################
# 3. Notification Services (OneSignal)
#########################################
-keep class com.onesignal.** { *; }
-dontwarn com.onesignal.**

#########################################
# 4. Payment Gateways (Stripe / Indian Gateways)
#########################################
-keep class com.stripe.android.** { *; }
-keep class com.phonepe.** { *; }
-keep class com.paytm.** { *; }
-dontwarn com.stripe.android.**
-dontwarn com.phonepe.**
-dontwarn com.paytm.**

#########################################
# 5. Kotlin & Reflection
#########################################
-keep class kotlin.Metadata { *; }
-keepclassmembers class kotlin.jvm.internal.** { *; }
-keepclassmembers class kotlin.reflect.** { *; }
-dontwarn kotlin.**

#########################################
# 6. AndroidX & Jetpack
#########################################
-keep class androidx.lifecycle.** { *; }
-keep class androidx.annotation.** { *; }
-dontwarn androidx.**

#########################################
# 7. Networking / Serialization (OkHttp, Okio, Retrofit, Gson)
#########################################
-keep class com.squareup.okhttp3.** { *; }
-keep class com.squareup.okhttp.** { *; }
-keep class com.squareup.okio.** { *; }
-keep class com.google.gson.** { *; }
-dontwarn com.squareup.okhttp3.**
-dontwarn com.squareup.okhttp.**
-dontwarn com.squareup.okio.**
-dontwarn com.google.gson.**

#########################################
# 8. General Noisy Warnings
#########################################
-dontwarn okio.**
-dontwarn javax.annotation.**
-dontwarn org.codehaus.mojo.animal_sniffer.**