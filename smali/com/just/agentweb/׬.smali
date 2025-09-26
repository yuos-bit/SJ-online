.class public Lcom/just/agentweb/׬;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/RomUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field private ̅:Ljava/lang/String;

.field private ̍:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic ̍(Lcom/just/agentweb/׬;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/just/agentweb/׬;->̅:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic ̎(Lcom/just/agentweb/׬;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/׬;->̅:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic ̐(Lcom/just/agentweb/׬;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/׬;->̍:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public ̒()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/׬;->̅:Ljava/lang/String;

    return-object v0
.end method

.method public ̓()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/׬;->̍:Ljava/lang/String;

    return-object v0
.end method

.method public ̔()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "3C1F00280007081E1C0F1D085C"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/just/agentweb/׬;->̅:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "42501B041C120E0A1C53"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/just/agentweb/׬;->̍:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "13"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
