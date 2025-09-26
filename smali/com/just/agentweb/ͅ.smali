.class public Lcom/just/agentweb/ͅ;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/AgentWeb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field private ̅:Z

.field private ̍:Lcom/just/agentweb/AgentWeb;


# direct methods
.method constructor <init>(Lcom/just/agentweb/AgentWeb;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/just/agentweb/ͅ;->̅:Z

    iput-object p1, p0, Lcom/just/agentweb/ͅ;->̍:Lcom/just/agentweb/AgentWeb;

    return-void
.end method


# virtual methods
.method public ̍()Lcom/just/agentweb/AgentWeb;
    .locals 1

    invoke-virtual {p0}, Lcom/just/agentweb/ͅ;->̐()Lcom/just/agentweb/ͅ;

    iget-object v0, p0, Lcom/just/agentweb/ͅ;->̍:Lcom/just/agentweb/AgentWeb;

    return-object v0
.end method

.method public ̎(Ljava/lang/String;)Lcom/just/agentweb/AgentWeb;
    .locals 1

    iget-boolean v0, p0, Lcom/just/agentweb/ͅ;->̅:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/ͅ;->̐()Lcom/just/agentweb/ͅ;

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ͅ;->̍:Lcom/just/agentweb/AgentWeb;

    invoke-static {v0, p1}, Lcom/just/agentweb/AgentWeb;->̒(Lcom/just/agentweb/AgentWeb;Ljava/lang/String;)Lcom/just/agentweb/AgentWeb;

    move-result-object p1

    return-object p1
.end method

.method public ̐()Lcom/just/agentweb/ͅ;
    .locals 1

    iget-boolean v0, p0, Lcom/just/agentweb/ͅ;->̅:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ͅ;->̍:Lcom/just/agentweb/AgentWeb;

    invoke-static {v0}, Lcom/just/agentweb/AgentWeb;->̐(Lcom/just/agentweb/AgentWeb;)Lcom/just/agentweb/AgentWeb;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/just/agentweb/ͅ;->̅:Z

    :cond_0
    return-object p0
.end method
