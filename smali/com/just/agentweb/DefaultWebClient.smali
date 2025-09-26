.class public Lcom/just/agentweb/DefaultWebClient;
.super Lcom/just/agentweb/MiddlewareWebClientBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/just/agentweb/΍;,
        Lcom/just/agentweb/΋;
    }
.end annotation


# static fields
.field public static final ALIPAYS_SCHEME:Ljava/lang/String; = "alipays://"

.field public static final ASK_USER_OPEN_OTHER_PAGE:I = 0xfa

.field private static final CONSTANTS_ABNORMAL_BIG:I = 0x7

.field public static final DERECT_OPEN_OTHER_PAGE:I = 0x3e9

.field public static final DISALLOW_OPEN_OTHER_APP:I = 0x3e

.field private static final HAS_ALIPAY_LIB:Z

.field public static final HTTPS_SCHEME:Ljava/lang/String; = "https://"

.field public static final HTTP_SCHEME:Ljava/lang/String; = "http://"

.field public static final INTENT_SCHEME:Ljava/lang/String; = "intent://"

.field public static final SCHEME_SMS:Ljava/lang/String; = "sms:"

.field private static final TAG:Ljava/lang/String;

.field public static final WEBCHAT_PAY_SCHEME:Ljava/lang/String; = "weixin://wap/pay?"


# instance fields
.field private mAgentWebUIController:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/just/agentweb/\u0337;",
            ">;"
        }
    .end annotation
.end field

.field private mCallback:Landroid/os/Handler$Callback;

.field private mErrorUrlsSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsInterceptUnkownUrl:Z

.field private mPayTask:Ljava/lang/Object;

.field private mUrlHandleWays:I

.field private mWaittingFinishSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mWebView:Landroid/webkit/WebView;

.field private mWebViewClient:Landroid/webkit/WebViewClient;

.field private onMainFrameErrorMethod:Ljava/lang/reflect/Method;

.field private webClientHelper:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-class v0, Lcom/just/agentweb/DefaultWebClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    :try_start_0
    const-string v0, "0D1F004F0F0D0E1513175E1E05054F06150240200C183A00140E"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/just/agentweb/DefaultWebClient;->HAS_ALIPAY_LIB:Z

    sget-object v1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "26313E3E2F2D2E3533372F21282C5B"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/just/agentweb/΋;)V
    .locals 3

    invoke-static {p1}, Lcom/just/agentweb/΋;->̍(Lcom/just/agentweb/΋;)Landroid/webkit/WebViewClient;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/just/agentweb/MiddlewareWebClientBase;-><init>(Landroid/webkit/WebViewClient;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    const/16 v2, 0xfa

    iput v2, p0, Lcom/just/agentweb/DefaultWebClient;->mUrlHandleWays:I

    iput-boolean v1, p0, Lcom/just/agentweb/DefaultWebClient;->mIsInterceptUnkownUrl:Z

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mCallback:Landroid/os/Handler$Callback;

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->onMainFrameErrorMethod:Ljava/lang/reflect/Method;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mErrorUrlsSet:Ljava/util/Set;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̎(Lcom/just/agentweb/΋;)Landroid/webkit/WebView;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWebView:Landroid/webkit/WebView;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̍(Lcom/just/agentweb/΋;)Landroid/webkit/WebViewClient;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWebViewClient:Landroid/webkit/WebViewClient;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̐(Lcom/just/agentweb/΋;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̒(Lcom/just/agentweb/΋;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̎(Lcom/just/agentweb/΋;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-static {v1}, Lcom/just/agentweb/͎;->̡(Landroid/webkit/WebView;)Lcom/just/agentweb/̷;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Lcom/just/agentweb/΋;->̓(Lcom/just/agentweb/΋;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->mIsInterceptUnkownUrl:Z

    invoke-static {p1}, Lcom/just/agentweb/΋;->̔(Lcom/just/agentweb/΋;)I

    move-result v0

    if-gtz v0, :cond_0

    iput v2, p0, Lcom/just/agentweb/DefaultWebClient;->mUrlHandleWays:I

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/just/agentweb/΋;->̔(Lcom/just/agentweb/΋;)I

    move-result p1

    iput p1, p0, Lcom/just/agentweb/DefaultWebClient;->mUrlHandleWays:I

    :goto_0
    return-void
.end method

.method static synthetic access$600(Lcom/just/agentweb/DefaultWebClient;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static createBuilder()Lcom/just/agentweb/΋;
    .locals 1

    new-instance v0, Lcom/just/agentweb/΋;

    invoke-direct {v0}, Lcom/just/agentweb/΋;-><init>()V

    return-object v0
.end method

.method private deepLink(Ljava/lang/String;)Z
    .locals 7

    iget v0, p0, Lcom/just/agentweb/DefaultWebClient;->mUrlHandleWays:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0xfa

    if-eq v0, v3, :cond_1

    const/16 v3, 0x3e9

    if-eq v0, v3, :cond_0

    return v2

    :cond_0
    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z

    return v1

    :cond_1
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_2

    return v2

    :cond_2
    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->lookupResolveInfo(Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v2, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    sget-object v4, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "1C151E0E02170245020F13060009045D"

    invoke-static {v6}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "4E111D114E110606190F17085B"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_4

    iget-object v3, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_4
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    iget-object v2, p0, Lcom/just/agentweb/DefaultWebClient;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->getCallback(Ljava/lang/String;)Landroid/os/Handler$Callback;

    move-result-object p1

    invoke-virtual {v0, v2, v3, p1}, Lcom/just/agentweb/̷;->̜(Landroid/webkit/WebView;Ljava/lang/String;Landroid/os/Handler$Callback;)V

    :cond_5
    return v1
.end method

.method private getCallback(Ljava/lang/String;)Landroid/os/Handler$Callback;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mCallback:Landroid/os/Handler$Callback;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/just/agentweb/΃;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/΃;-><init>(Lcom/just/agentweb/DefaultWebClient;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mCallback:Landroid/os/Handler$Callback;

    return-object v0
.end method

.method private handleCommonLink(Ljava/lang/String;)Z
    .locals 3

    const-string v0, "1A15015B"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const-string v0, "1D1D1E5B"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "0311040D1A0E5D"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "0915025B5E4D575A0353"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_2

    return v1

    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string v2, "0F1E09130108034B1B0004080F1A4F060606071F034F38282232"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    sget-boolean v0, Lcom/just/agentweb/͈;->̒:Z

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    :cond_3
    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method private handleIntentUrl(Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "071E190400155D4A5D"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    return-void
.end method

.method private isAlipay(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return v0

    :cond_0
    iget-object v2, p0, Lcom/just/agentweb/DefaultWebClient;->mPayTask:Ljava/lang/Object;

    const/4 v3, 0x1

    if-nez v2, :cond_1

    const-string v2, "0D1F004F0F0D0E1513175E1E05054F06150240200C183A00140E"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/app/Activity;

    aput-object v5, v4, v0

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mPayTask:Ljava/lang/Object;

    :cond_1
    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mPayTask:Ljava/lang/Object;

    check-cast v1, Lcom/alipay/sdk/app/PayTask;

    new-instance v2, Lcom/just/agentweb/΁;

    invoke-direct {v2, p0, p1}, Lcom/just/agentweb/΁;-><init>(Lcom/just/agentweb/DefaultWebClient;Landroid/webkit/WebView;)V

    invoke-virtual {v1, p2, v3, v2}, Lcom/alipay/sdk/app/PayTask;->payInterceptorWithUrl(Ljava/lang/String;ZLcom/alipay/sdk/app/H5PayCallback;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object v1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0F1C04110F184A0C01271E19041C020215060B1457"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "4E501813025B"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    return p1

    :catchall_0
    sget-boolean p1, Lcom/just/agentweb/͈;->̒:Z

    return v0
.end method

.method private lookup(Ljava/lang/String;)Z
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-static {p1, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const/high16 v3, 0x10000

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private lookupResolveInfo(Ljava/lang/String;)Landroid/content/pm/ResolveInfo;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p1, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const/high16 v2, 0x10000

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    return-object v0
.end method

.method private onMainFrameError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 9

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mErrorUrlsSet:Ljava/util/Set;

    invoke-interface {v0, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWebViewClient:Landroid/webkit/WebViewClient;

    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->onMainFrameErrorMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x5

    if-nez v1, :cond_0

    new-array v1, v7, [Ljava/lang/Class;

    const-class v8, Lcom/just/agentweb/̷;

    aput-object v8, v1, v6

    const-class v8, Landroid/webkit/WebView;

    aput-object v8, v1, v5

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v1, v4

    const-class v8, Ljava/lang/String;

    aput-object v8, v1, v3

    const-class v8, Ljava/lang/String;

    aput-object v8, v1, v2

    const-string v8, "011E2000070F211713031528131C0E15"

    invoke-static {v8}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8, v1}, Lcom/just/agentweb/͎;->͇(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->onMainFrameErrorMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_2

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWebViewClient:Landroid/webkit/WebViewClient;

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v6

    aput-object p1, v7, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v4

    aput-object p3, v7, v3

    aput-object p4, v7, v2

    invoke-virtual {v1, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/just/agentweb/̷;->̚(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method private queryActiviesNumber(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    iget-object v1, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/high16 v2, 0x10000

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Ljava/net/URISyntaxException;->printStackTrace()V

    :cond_2
    return v0
.end method

.method private startActivity(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "0F1E09130108034B1B0004080F1A4F060606071F034F38282232"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/just/agentweb/DefaultWebClient;->mWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/just/agentweb/WebViewClientDelegate;->doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mErrorUrlsSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0}, Lcom/just/agentweb/̷;->̠()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setVisibility(I)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_2
    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mErrorUrlsSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mErrorUrlsSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :cond_3
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mWaittingFinishSet:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/just/agentweb/WebViewClientDelegate;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "011E3F040D040E13170A351F13011388D9E8"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E502E2E2A245D"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p4, :cond_0

    const/16 v0, -0xc

    if-eq p2, v0, :cond_0

    return-void

    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    return-void

    :cond_1
    const/4 v0, -0x2

    if-eq p2, v0, :cond_2

    if-eqz p4, :cond_2

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/just/agentweb/DefaultWebClient;->onMainFrameError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 5

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    move-result v1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    if-nez v0, :cond_1

    const/16 v2, -0xc

    if-eq v1, v2, :cond_1

    return-void

    :cond_1
    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    return-void

    :cond_2
    sget-object v2, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "011E3F040D040E13170A351F1301135D"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "4E1302050B5B"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "4E160C0802080902271C1C57"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "4E1708153B130B5F"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "4E17081521130E021B001101341C0D5D"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, -0x2

    if-eq v1, v2, :cond_3

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    move-result v0

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, v0, p3, p2}, Lcom/just/agentweb/DefaultWebClient;->onMainFrameError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Lcom/just/agentweb/WebViewClientDelegate;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/just/agentweb/WebViewClientDelegate;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/DefaultWebClient;->mAgentWebUIController:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    invoke-virtual {v0, p1, p2, p3}, Lcom/just/agentweb/̷;->̢(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    :cond_0
    return-void
.end method

.method public onScaleChanged(Landroid/webkit/WebView;FF)V
    .locals 3

    sget-object v0, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "011E3E020F0D02261A0F1E0A040A5B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "4E504D0F54"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    sub-float v0, p3, p2

    const/high16 v1, 0x40e00000    # 7.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    div-float/2addr p2, p3

    const/high16 p3, 0x42c80000    # 100.0f

    mul-float p2, p2, p3

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setInitialScale(I)V

    :cond_0
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "06041911544E48"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_8

    const-string v1, "060419111D5B484A"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-boolean v1, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    if-nez v1, :cond_1

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p1

    return p1

    :cond_1
    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->handleCommonLink(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    const-string v1, "071E190400155D4A5D"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->handleIntentUrl(Ljava/lang/String;)V

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    const-string p2, "071E190400154710000250"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_3
    const-string v1, "19150419070F5D4A5D19111D4E1E001E5A"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    const-string p2, "021F020A1B114712170D180C154E150845020F094D1F10"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->startActivity(Ljava/lang/String;)V

    return v2

    :cond_4
    const-string v1, "0F1C04110F18145F5D41"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    const-string p2, "0F1C04110F181445071C1C4D0D010E0C10024E1101081E001E450C1050"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_5
    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->queryActiviesNumber(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_6

    invoke-direct {p0, v0}, Lcom/just/agentweb/DefaultWebClient;->deepLink(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "071E19041C020215064E051F0D54"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_6
    iget-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->mIsInterceptUnkownUrl:Z

    if-eqz v0, :cond_7

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "071E19041C020215064E25030A0116093000025057"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_7
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p1

    return p1

    :cond_8
    :goto_0
    iget-boolean p2, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    if-eqz p2, :cond_9

    sget-boolean p2, Lcom/just/agentweb/DefaultWebClient;->HAS_ALIPAY_LIB:Z

    if-eqz p2, :cond_9

    invoke-direct {p0, p1, v0}, Lcom/just/agentweb/DefaultWebClient;->isAlipay(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_1

    :cond_9
    const/4 v2, 0x0

    :goto_1
    return v2
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    const-string v0, "06041911544E48"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_8

    const-string v0, "060419111D5B484A"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->handleCommonLink(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    :cond_2
    const-string v0, "071E190400155D4A5D"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->handleIntentUrl(Ljava/lang/String;)V

    return v2

    :cond_3
    const-string v0, "19150419070F5D4A5D19111D4E1E001E5A"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->startActivity(Ljava/lang/String;)V

    return v2

    :cond_4
    const-string v0, "0F1C04110F18145F5D41"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->lookup(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v2

    :cond_5
    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->queryActiviesNumber(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_6

    invoke-direct {p0, p2}, Lcom/just/agentweb/DefaultWebClient;->deepLink(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    const-string p2, "071E19041C020215064E3F19090B132615023D1305040304"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_6
    iget-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->mIsInterceptUnkownUrl:Z

    if-eqz v0, :cond_7

    sget-object p1, Lcom/just/agentweb/DefaultWebClient;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "071E19041C020215064E3903150B130400021A25030A0116093611061500044E5B47"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_7
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/WebViewClientDelegate;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_8
    :goto_1
    iget-boolean v0, p0, Lcom/just/agentweb/DefaultWebClient;->webClientHelper:Z

    if-eqz v0, :cond_9

    sget-boolean v0, Lcom/just/agentweb/DefaultWebClient;->HAS_ALIPAY_LIB:Z

    if-eqz v0, :cond_9

    invoke-direct {p0, p1, p2}, Lcom/just/agentweb/DefaultWebClient;->isAlipay(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    const/4 v1, 0x1

    :cond_9
    return v1
.end method
