# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

### --- start: 基本不动区域 -----------------------------------------------------------------
# --- 基本指令区 ----------------------------------------------------------------------------
-optimizationpasses 5       # 指定代码的压缩级别
-dontusemixedcaseclassnames     # 是否使用大小写混合
-dontskipnonpubliclibraryclasses        # 指定不去忽略非公共的库类
-dontskipnonpubliclibraryclassmembers       # 指定不去忽略包可见的库类的成员
-dontpreverify      # 混淆时是否做预校验
-verbose        # 混淆时是否记录日志
-printmapping proguardMapping.txt
-optimizations !code/simplification/cast,!field/*,!class/merging/*      # 混淆时所采用的算法
-keepattributes *Annotation*,InnerClasses
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable
#------------------------------------------------------------------------------------------
-ignorewarnings     # 是否忽略检测，（是）
# --- 默认保留区 ---------------------------------------------------------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.android.vending.licensing.ILicensingService
-keep class android.support.** {*;}
#-ignorewarnings -keep class * { public private *; }

# --- kotlin ------------------------------------------------------------------------------
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    static void checkParameterIsNotNull(java.lang.Object, java.lang.String);
}

# --- native ------------------------------------------------------------------------------
-keepclasseswithmembernames class * {
    native <methods>;
}

# --- 如果有引用v4包可以添加下面这行 ---------------------------------------------------------
#-keep class android.support.v4.** { *; }
#-keep public class * extends android.support.v4.**
#-keep public class * extends android.app.Fragment

-keepclasseswithmembernames class * {
    native <methods>;
}
-keepclassmembers class * extends android.app.Activity{
    public void *(android.view.View);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
# --- androidx 及 material ----------------------------------------------------------------
-keep class com.google.android.material.** {*;}
-keep class androidx.** {*;}
-keep public class * extends androidx.**
-keep interface androidx.** {*;}
-dontwarn com.google.android.material.**
-dontwarn androidx.**

# --- 不混淆R文件中的所有静态字段 ------------------------------------------------------------
-keep class **.R$* {
    public static <fields>;
}
-keepclassmembers class * {
    void *(**On*Event);
}
#------------------------------------------------------------------------------------------

# --- webview -----------------------------------------------------------------------------
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, jav.lang.String);
}
### --- end: 基本不动区域 -------------------------------------------------------------------




#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
### --- 三方等自定义混淆 --------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------

### --- start: 腾讯原生UI框架 ---------------------------------------------------------------
-keep class **_FragmentFinder { *; }
-keep class com.qmuiteam.qmui.arch.record.** { *; }
-keep class androidx.fragment.app.* { *; }
### --- end: 腾讯原生UI框架 -----------------------------------------------------------------

### --- start: 保持实体类不被混淆 ------------------------------------------------------------
-keep class mm.chenme.lib.commutillibdemo.model.** {*;} # 如果实体类被混淆了，则无法正常解析
### --- end: 保持实体类不被混淆 --------------------------------------------------------------

### --- start: 去除自定义的 Log 日志 ---------------------------------------------------------
-assumenosideeffects class mm.chenme.lib.commutillib.utils.* {
    # mm.chenme.lib.commutillib.utils.LogUtil
    *** loge(...);
    *** logw(...);
    *** logd(...);
    *** logi(...);
    *** logd(...);
}
### --- end: 去除自定义的 Log 日志 -----------------------------------------------------------