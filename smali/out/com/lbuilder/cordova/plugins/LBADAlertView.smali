.class public Lcom/lbuilder/cordova/plugins/LBADAlertView;
.super Ljava/lang/Object;
.source "LBADAlertView.java"


# static fields
.field public static app_expire:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/lbuilder/cordova/plugins/LBADAlertView;->app_expire:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compare_date(Ljava/util/Date;)I
    .registers 9
    .param p0, "expDate"    # Ljava/util/Date;

    .prologue
    const/4 v2, 0x0

    .line 170
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 173
    .local v1, "nowDate":Ljava/util/Date;
    :try_start_6
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_1b

    .line 174
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "\u670d\u52a1\u5df2\u8fc7\u671f"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 175
    const/4 v2, -0x1

    .line 185
    :cond_1a
    :goto_1a
    return v2

    .line 176
    :cond_1b
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-gez v3, :cond_1a

    .line 177
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "\u670d\u52a1ing"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_2e} :catch_30

    .line 178
    const/4 v2, 0x1

    goto :goto_1a

    .line 182
    :catch_30
    move-exception v0

    .line 183
    .local v0, "exception":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1a
.end method

.method public static getNavDataJson(Landroid/app/Activity;)Lorg/json/JSONObject;
    .registers 10
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 98
    const/4 v2, 0x0

    .line 100
    .local v2, "datajson":Lorg/json/JSONObject;
    :try_start_1
    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    const-string v8, "data.json"

    invoke-virtual {v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v5, v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 101
    .local v5, "isr":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 103
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .local v1, "builder":Ljava/lang/StringBuilder;
    :goto_1c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, "line":Ljava/lang/String;
    if-nez v6, :cond_33

    .line 107
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 108
    invoke-virtual {v5}, Ljava/io/InputStreamReader;->close()V

    .line 109
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .end local v2    # "datajson":Lorg/json/JSONObject;
    .local v3, "datajson":Lorg/json/JSONObject;
    move-object v2, v3

    .line 114
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "datajson":Lorg/json/JSONObject;
    .end local v5    # "isr":Ljava/io/InputStreamReader;
    .end local v6    # "line":Ljava/lang/String;
    .restart local v2    # "datajson":Lorg/json/JSONObject;
    :goto_32
    return-object v2

    .line 105
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v5    # "isr":Ljava/io/InputStreamReader;
    .restart local v6    # "line":Ljava/lang/String;
    :cond_33
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_36} :catch_37

    goto :goto_1c

    .line 111
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v5    # "isr":Ljava/io/InputStreamReader;
    .end local v6    # "line":Ljava/lang/String;
    :catch_37
    move-exception v4

    .line 112
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_32
.end method

.method public static getNavURL(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "lbuilderID"    # Ljava/lang/String;

    .prologue
    .line 87
    const-string v0, ""

    .line 88
    .local v0, "urlstring":Ljava/lang/String;
    const-string v1, "http"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "&fun=judgeAdvert&plc=1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    :goto_1d
    return-object v0

    .line 93
    :cond_1e
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://api.lbuilder.com/app/server.php?fun=judgeAdvert&plc=1&id="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method public static getUrlResponce(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "urlString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 126
    const/4 v7, 0x0

    .line 128
    .local v7, "url":Ljava/net/URL;
    :try_start_2
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_7} :catch_2a

    .line 133
    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    const/4 v1, 0x0

    .line 135
    .local v1, "connection":Ljava/net/URLConnection;
    :try_start_8
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_33

    move-result-object v1

    .line 142
    const/4 v3, 0x0

    .line 145
    .local v3, "is":Ljava/io/InputStream;
    :try_start_d
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_36

    move-result-object v3

    .line 150
    const/16 v9, 0x400

    new-array v0, v9, [B

    .line 152
    .local v0, "bs":[B
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 154
    .local v5, "sb":Ljava/lang/StringBuffer;
    :goto_1a
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "len":I
    const/4 v9, -0x1

    if-ne v4, v9, :cond_39

    .line 158
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 159
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    move-object v7, v8

    .end local v0    # "bs":[B
    .end local v1    # "connection":Ljava/net/URLConnection;
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "len":I
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_29
    return-object v9

    .line 129
    :catch_2a
    move-exception v2

    .line 130
    .local v2, "e":Ljava/net/MalformedURLException;
    const-string v10, "SystemWebViewEngine"

    const-string v11, "\u7f51\u7edc\u9519\u8bef\uff1aMalformedURLException"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_29

    .line 137
    .end local v2    # "e":Ljava/net/MalformedURLException;
    .end local v7    # "url":Ljava/net/URL;
    .restart local v1    # "connection":Ljava/net/URLConnection;
    .restart local v8    # "url":Ljava/net/URL;
    :catch_33
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    move-object v7, v8

    .line 139
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    goto :goto_29

    .line 146
    .end local v2    # "e":Ljava/io/IOException;
    .end local v7    # "url":Ljava/net/URL;
    .restart local v3    # "is":Ljava/io/InputStream;
    .restart local v8    # "url":Ljava/net/URL;
    :catch_36
    move-exception v2

    .restart local v2    # "e":Ljava/io/IOException;
    move-object v7, v8

    .line 148
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    goto :goto_29

    .line 155
    .end local v2    # "e":Ljava/io/IOException;
    .end local v7    # "url":Ljava/net/URL;
    .restart local v0    # "bs":[B
    .restart local v4    # "len":I
    .restart local v5    # "sb":Ljava/lang/StringBuffer;
    .restart local v8    # "url":Ljava/net/URL;
    :cond_39
    new-instance v6, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v6, v0, v9, v4}, Ljava/lang/String;-><init>([BII)V

    .line 156
    .local v6, "str":Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1a
.end method

.method public static judgeAlertADView(Ljava/lang/String;Landroid/app/Activity;)V
    .registers 6
    .param p0, "lbuildID"    # Ljava/lang/String;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 29
    sget-wide v0, Lcom/lbuilder/cordova/plugins/LBADAlertView;->app_expire:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_16

    .line 30
    sget-wide v0, Lcom/lbuilder/cordova/plugins/LBADAlertView;->app_expire:J

    invoke-static {v0, v1}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->timeToDate(J)Ljava/util/Date;

    move-result-object v0

    invoke-static {v0}, Lcom/lbuilder/cordova/plugins/LBADAlertView;->compare_date(Ljava/util/Date;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_16

    .line 61
    :goto_15
    return-void

    .line 35
    :cond_16
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;

    invoke-direct {v1, p0, p1}, Lcom/lbuilder/cordova/plugins/LBADAlertView$1;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 58
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_15
.end method

.method public static showADAlertView(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V
    .registers 7
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 64
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 66
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 68
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 70
    const-string v2, "\u786e\u5b9a"

    new-instance v3, Lcom/lbuilder/cordova/plugins/LBADAlertView$2;

    invoke-direct {v3}, Lcom/lbuilder/cordova/plugins/LBADAlertView$2;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 78
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 80
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 81
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 82
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 83
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 84
    return-void
.end method

.method public static timeToDate(J)Ljava/util/Date;
    .registers 10
    .param p0, "timestamp"    # J

    .prologue
    const-wide/16 v6, 0x3e8

    .line 163
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Date;

    mul-long v4, p0, v6

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "result1":Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "10\u4f4d\u6570\u7684\u65f6\u95f4\u6233\uff08\u79d2\uff09--->Date:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 165
    new-instance v0, Ljava/util/Date;

    mul-long v2, p0, v6

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 166
    .local v0, "date1":Ljava/util/Date;
    return-object v0
.end method
