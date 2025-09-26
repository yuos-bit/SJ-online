.class public Lcom/good321/sjh5/webview/MiddlewareWebViewClient;
.super Lcom/just/agentweb/MiddlewareWebClientBase;


# static fields
.field private static count:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x3

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    const-string v0, "B5D7B6FEB5FDBCF3A9C9ABF5BAF6BAFCBEE8B5D8B6F9B5C5BCFDA9CBABCFBAF2BAC5BED3B5DBB6C9B5F9BCFFA9C5ABC8BAF6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x302

    const v3, -0x295384be

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    return-void

    :pswitch_data_0
    .packed-switch 0x496b1d79
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/just/agentweb/MiddlewareWebClientBase;-><init>()V

    return-void
.end method


# virtual methods
.method public native shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
.end method

.method public native shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
.end method
