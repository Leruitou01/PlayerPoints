# Rename code without removing classes or changing execution flow.
-dontshrink
-dontoptimize
-keepattributes Exceptions,InnerClasses,EnclosingMethod,Signature,*Annotation*,MethodParameters

# Bukkit entry point and public integration API.
-keep public class org.black_ixx.playerpoints.PlayerPoints { public protected *; }
-keep public class org.black_ixx.playerpoints.PlayerPointsAPI { public protected *; }
-keep class org.black_ixx.playerpoints.event.** { *; }
-keep class org.black_ixx.playerpoints.models.** { *; }

# Bundled libraries use reflection, service loading, and platform-specific hooks.
-keep class org.black_ixx.playerpoints.libs.** { *; }
-keep class !org.black_ixx.playerpoints.**,** { *; }

# RoseGarden instantiates managers and commands reflectively.
-keepnames class org.black_ixx.playerpoints.manager.**
-keep class org.black_ixx.playerpoints.config.** { *; }
-keepclassmembers class * {
    public <init>(...);
    @org.black_ixx.playerpoints.libs.rosegarden.command.framework.annotation.RoseExecutable <methods>;
    @org.bukkit.event.EventHandler <methods>;
}
-keepclassmembers enum * { public static **[] values(); public static ** valueOf(java.lang.String); }

# Optional integrations of bundled libraries are not shipped by this plugin.
-dontwarn org.slf4j.**
-dontwarn org.apache.logging.**
-dontwarn javax.annotation.**
-dontwarn org.jetbrains.annotations.**
-dontwarn com.codahale.metrics.**
-dontwarn io.micrometer.**
-dontwarn com.zaxxer.hikari.metrics.**
# Paper/Folia methods are supplied at runtime, while compilation uses Spigot.
-dontwarn io.papermc.paper.threadedregions.scheduler.**
-dontwarn org.black_ixx.playerpoints.libs.rosegarden.scheduler.wrapper.FoliaSchedulerWrapper
-dontwarn org.black_ixx.playerpoints.libs.rosegarden.command.argument.OfflinePlayerArgumentHandler
