.class Lcom/good321/sjh5/GameFragment$2;
.super Lcom/good321/sjh5/webview/MiddlewareWebViewClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/good321/sjh5/ٍ;->̒()Lcom/just/agentweb/MiddlewareWebClientBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final this$0:Lcom/good321/sjh5/ٍ;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x11

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method constructor <init>(Lcom/good321/sjh5/ٍ;)V
    .locals 0

    iput-object p1, p0, Lcom/good321/sjh5/GameFragment$2;->this$0:Lcom/good321/sjh5/ٍ;

    invoke-direct {p0}, Lcom/good321/sjh5/webview/MiddlewareWebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public native onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
.end method

.method public native shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
.end method

.method public native shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
.end method
