#########################################
# 1. Flutter (MANDATORY)
#########################################
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

#########################################
# 2. Firebase & Google Services
#########################################
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

# Firebase Messaging
-keep class com.google.firebase.messaging.** { *; }

#########################################
# 3. Google Sign-In
#########################################
-keep class com.google.android.gms.auth.api.signin.** { *; }

#########################################
# 4. OneSignal
#########################################
-keep class com.onesignal.** { *; }
-dontwarn com.onesignal.**

#########################################
# 5. Razorpay (Payments)
#########################################
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**

#########################################
# 6. Google Maps & Location
#########################################
-keep class com.google.android.gms.maps.** { *; }
-dontwarn com.google.android.gms.maps.**

#########################################
# 7. Sentry
#########################################
-keep class io.sentry.** { *; }
-dontwarn io.sentry.**

#########################################
# 8. Kotlin
#########################################
-keep class kotlin.Metadata { *; }
-keepclassmembers class kotlin.** { *; }
-dontwarn kotlin.**

#########################################
# 9. AndroidX
#########################################
-keep class androidx.** { *; }
-dontwarn androidx.**

#########################################
# 10. Networking
#########################################
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**

#########################################
# 11. Plugins (Geolocator, Storage, URL)
#########################################
-keep class com.baseflow.** { *; }
-keep class com.it_nomads.fluttersecurestorage.** { *; }
-keep class io.flutter.plugins.urllauncher.** { *; }

#########################################
# 🚨 CRITICAL FIXES (NO DEPENDENCIES VERSION)
#########################################

# Ignore OpenTelemetry (causing Jackson errors)
-dontwarn io.opentelemetry.**

# Ignore Jackson (do NOT add dependency)
-dontwarn com.fasterxml.jackson.**

# Ignore Play Core (Flutter internal reference)
-dontwarn com.google.android.play.core.**
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

# Ignore AutoValue
-dontwarn com.google.auto.value.**