.class public Lcom/just/agentweb/̓;
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
.field private ̅:Lcom/just/agentweb/̿;


# direct methods
.method public constructor <init>(Lcom/just/agentweb/̿;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    iput-object p1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    return-void
.end method


# virtual methods
.method public ̍()Lcom/just/agentweb/͂;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/just/agentweb/̿;->͔(Lcom/just/agentweb/̿;Z)Z

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/just/agentweb/̿;->͛(Lcom/just/agentweb/̿;I)I

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {v0, v1}, Lcom/just/agentweb/̿;->̓(Lcom/just/agentweb/̿;I)I

    new-instance v0, Lcom/just/agentweb/͂;

    iget-object v1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-direct {v0, v1}, Lcom/just/agentweb/͂;-><init>(Lcom/just/agentweb/̿;)V

    return-object v0
.end method

.method public ̎(Lcom/just/agentweb/BaseIndicatorView;)Lcom/just/agentweb/͂;
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {v1, v0}, Lcom/just/agentweb/̿;->͔(Lcom/just/agentweb/̿;Z)Z

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {v0, p1}, Lcom/just/agentweb/̿;->͗(Lcom/just/agentweb/̿;Lcom/just/agentweb/BaseIndicatorView;)Lcom/just/agentweb/BaseIndicatorView;

    iget-object p1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {p1, v0}, Lcom/just/agentweb/̿;->͔(Lcom/just/agentweb/̿;Z)Z

    iget-object p1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    :goto_0
    invoke-static {p1, v0}, Lcom/just/agentweb/̿;->͊(Lcom/just/agentweb/̿;Z)Z

    new-instance p1, Lcom/just/agentweb/͂;

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-direct {p1, v0}, Lcom/just/agentweb/͂;-><init>(Lcom/just/agentweb/̿;)V

    return-object p1
.end method

.method public ̐()Lcom/just/agentweb/͂;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/just/agentweb/̿;->͔(Lcom/just/agentweb/̿;Z)Z

    new-instance v0, Lcom/just/agentweb/͂;

    iget-object v1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-direct {v0, v1}, Lcom/just/agentweb/͂;-><init>(Lcom/just/agentweb/̿;)V

    return-object v0
.end method

.method public ̐(I)Lcom/just/agentweb/͂;
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/just/agentweb/̿;->͔(Lcom/just/agentweb/̿;Z)Z

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {v0, p1}, Lcom/just/agentweb/̿;->͛(Lcom/just/agentweb/̿;I)I

    new-instance p1, Lcom/just/agentweb/͂;

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-direct {p1, v0}, Lcom/just/agentweb/͂;-><init>(Lcom/just/agentweb/̿;)V

    return-object p1
.end method

.method public ̐(II)Lcom/just/agentweb/͂;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {v0, p1}, Lcom/just/agentweb/̿;->͛(Lcom/just/agentweb/̿;I)I

    iget-object p1, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-static {p1, p2}, Lcom/just/agentweb/̿;->̓(Lcom/just/agentweb/̿;I)I

    new-instance p1, Lcom/just/agentweb/͂;

    iget-object p2, p0, Lcom/just/agentweb/̓;->̅:Lcom/just/agentweb/̿;

    invoke-direct {p1, p2}, Lcom/just/agentweb/͂;-><init>(Lcom/just/agentweb/̿;)V

    return-object p1
.end method
