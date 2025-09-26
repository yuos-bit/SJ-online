.class public Lnp/̶;
.super Ljava/lang/Object;


# instance fields
.field private ̅:Lcom/just/agentweb/AgentWeb;

.field private ̍:Lcom/good321/sjh5/ٍ;


# direct methods
.method public constructor <init>(Lcom/just/agentweb/AgentWeb;Lcom/good321/sjh5/ٍ;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lnp/̶;->̅:Lcom/just/agentweb/AgentWeb;

    .line 14
    iput-object p2, p0, Lnp/̶;->̍:Lcom/good321/sjh5/ٍ;

    return-void
.end method


# virtual methods
.method public getAndroid()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "2F1E0913010803"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
