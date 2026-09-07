# 关闭名称混淆：类、方法、字段不重命名；R8依旧做代码删减、字节码优化
-dontobfuscate

-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.Conscrypt$Version
-dontwarn org.conscrypt.Conscrypt
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE
-dontwarn java.beans.Introspector
-dontwarn java.beans.VetoableChangeListener
-dontwarn java.beans.VetoableChangeSupport

# Keep ini4j Service Provider Interface
-keep,allowobfuscation,allowoptimization public class org.ini4j.spi.*

# Kotlin
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    public static void check*(...);
    public static void throw*(...);
}

# ⚠️重要提示：‑repackageclasses 在 -dontobfuscate 下行为
# ‑repackageclasses 会移动类到同一个目标包，但不会修改类名；如果你不想包名被移动，可以注释掉这一行
-repackageclasses
-allowaccessmodification
-overloadaggressively
-renamesourcefileattribute SourceFile

# JNI 原生调用类，完整保留
-keepclassmembers class me.bmax.apatch.Natives {
    public static volatile boolean isNativeAvailable;
    public static void tryLoadNativeLibrary();
}
-keep class me.bmax.apatch.Natives { *; }

# -------- 补充APatch项目必需keep规则（防止R8摇树误删） --------
# JNI native方法保护
-keepclasseswithmembernames class * {
    native <methods>;
}

# Compose‑Destinations KSP生成路由类
-keep class me.bmax.apatch.destinations.** { *; }
-keep class * extends com.ramcosta.composedestinations.dynamic.** { *; }

# Parcelize序列化
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}
