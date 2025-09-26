.class Lcom/just/agentweb/΁;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/alipay/sdk/app/H5PayCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/DefaultWebClient;->isAlipay(Landroid/webkit/WebView;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/DefaultWebClient;

.field final synthetic ̍:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/just/agentweb/DefaultWebClient;Landroid/webkit/WebView;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΁;->̅:Lcom/just/agentweb/DefaultWebClient;

    iput-object p2, p0, Lcom/just/agentweb/΁;->̍:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ̍(Lcom/alipay/sdk/util/H5PayResultModel;)V
    .locals 1

    invoke-virtual {p1}, Lcom/alipay/sdk/util/H5PayResultModel;->getReturnUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/just/agentweb/΂;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/΂;-><init>(Lcom/just/agentweb/΁;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/just/agentweb/͎;->͏(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
