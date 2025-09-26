.class Lcom/just/agentweb/ͤ;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͛;->̓(Ljava/lang/String;)Landroid/os/Handler$Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͛;

.field final synthetic ̍:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͛;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ͤ;->̅:Lcom/just/agentweb/͛;

    iput-object p2, p0, Lcom/just/agentweb/ͤ;->̍:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    iget-object p1, p0, Lcom/just/agentweb/ͤ;->̅:Lcom/just/agentweb/͛;

    iget-object v0, p0, Lcom/just/agentweb/ͤ;->̍:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/just/agentweb/͛;->̕(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method
