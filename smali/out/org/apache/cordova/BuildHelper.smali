.class public Lorg/apache/cordova/BuildHelper;
.super Ljava/lang/Object;
.source "BuildHelper.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-string v0, "BuildHelper"

    sput-object v0, Lorg/apache/cordova/BuildHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBuildConfigValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 54
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".BuildConfig"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 55
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 56
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_24} :catch_26
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_24} :catch_32
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_24} :catch_4c

    move-result-object v3

    .line 67
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :goto_25
    return-object v3

    .line 57
    :catch_26
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-object v4, Lorg/apache/cordova/BuildHelper;->TAG:Ljava/lang/String;

    const-string v5, "Unable to get the BuildConfig, is this built with ANT?"

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_25

    .line 60
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_32
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    sget-object v4, Lorg/apache/cordova/BuildHelper;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " is not a valid field. Check your build.gradle"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_25

    .line 62
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    :catch_4c
    move-exception v1

    .line 63
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v4, Lorg/apache/cordova/BuildHelper;->TAG:Ljava/lang/String;

    const-string v5, "Illegal Access Exception: Let\'s print a stack trace."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_25
.end method
