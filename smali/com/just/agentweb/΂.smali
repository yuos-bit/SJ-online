.class Lcom/just/agentweb/΂;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/΁;->̍(Lcom/alipay/sdk/util/H5PayResultModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/΁;

.field final synthetic ̍:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/just/agentweb/΁;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/΂;->̅:Lcom/just/agentweb/΁;

    iput-object p2, p0, Lcom/just/agentweb/΂;->̍:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/΂;->̅:Lcom/just/agentweb/΁;

    iget-object v0, v0, Lcom/just/agentweb/΁;->̍:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/just/agentweb/΂;->̍:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
