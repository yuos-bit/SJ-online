.class Lcom/just/agentweb/ͣ;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͛;->onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͛;

.field final synthetic ̍:Ljava/lang/String;

.field final synthetic ̎:J

.field final synthetic ̐:Ljava/lang/String;

.field final synthetic ̒:Ljava/lang/String;

.field final synthetic ̓:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͛;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ͣ;->̅:Lcom/just/agentweb/͛;

    iput-object p2, p0, Lcom/just/agentweb/ͣ;->̒:Ljava/lang/String;

    iput-object p3, p0, Lcom/just/agentweb/ͣ;->̓:Ljava/lang/String;

    iput-object p4, p0, Lcom/just/agentweb/ͣ;->̍:Ljava/lang/String;

    iput-object p5, p0, Lcom/just/agentweb/ͣ;->̐:Ljava/lang/String;

    iput-wide p6, p0, Lcom/just/agentweb/ͣ;->̎:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/just/agentweb/ͣ;->̅:Lcom/just/agentweb/͛;

    iget-object v1, p0, Lcom/just/agentweb/ͣ;->̒:Ljava/lang/String;

    iget-object v2, p0, Lcom/just/agentweb/ͣ;->̓:Ljava/lang/String;

    iget-object v3, p0, Lcom/just/agentweb/ͣ;->̍:Ljava/lang/String;

    iget-object v4, p0, Lcom/just/agentweb/ͣ;->̐:Ljava/lang/String;

    iget-wide v5, p0, Lcom/just/agentweb/ͣ;->̎:J

    invoke-virtual/range {v0 .. v6}, Lcom/just/agentweb/͛;->̙(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
