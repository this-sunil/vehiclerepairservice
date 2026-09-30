# ============================================================
# Flutter + Firebase + Google + OneSignal + Maps + ML Kit
# Complete R8 / ProGuard Rules
# ============================================================

# ---------------- Flutter ----------------
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# ---------------- Firebase ----------------
-keep class com.google.firebase.** { *; }
-keep class com.google.firebase.components.** { *; }
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.auth.** { *; }

# ---------------- Google Sign In / Play Services ----------------
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.play.core.**

# ---------------- Google Maps ----------------
-keep class com.google.android.gms.maps.** { *; }
-keep class com.google.android.gms.maps.model.** { *; }

# ---------------- Google ML Kit ----------------
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.internal.mlkit_** { *; }

# ---------------- OneSignal ----------------
-keep class com.onesignal.** { *; }
-keep class com.onesignal.**Service { *; }
-keep class com.onesignal.**Receiver { *; }

# ---------------- Socket.IO ----------------
-keep class io.socket.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# ---------------- Local Notifications ----------------
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# ---------------- Geolocator ----------------
-keep class com.baseflow.geolocator.** { *; }

# ---------------- Geocoding ----------------
-keep class com.baseflow.geocoding.** { *; }

# ---------------- Connectivity Plus ----------------
-keep class dev.fluttercommunity.plus.connectivity.** { *; }

# ---------------- Image Picker ----------------
-keep class io.flutter.plugins.imagepicker.** { *; }

# ---------------- URL Launcher ----------------
-keep class io.flutter.plugins.urllauncher.** { *; }

# ---------------- Secure Storage ----------------
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# ---------------- Shorebird ----------------
-keep class com.shorebird.** { *; }

# ---------------- Lottie ----------------
-keep class com.airbnb.lottie.** { *; }

# ---------------- Android Speech / TTS ----------------
-keep class android.speech.** { *; }

# ---------------- JSON / Reflection ----------------
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# ---------------- Gson / JSON adapters if used ----------------
-keep class **JsonAdapter { *; }

# ---------------- Parcelable ----------------
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# ---------------- Serializable ----------------
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ---------------- Common Warnings ----------------
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn sun.misc.**



