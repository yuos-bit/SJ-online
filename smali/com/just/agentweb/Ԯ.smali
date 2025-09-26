.class Lcom/just/agentweb/Ԯ;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/ԭ;->̎(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/ԭ;

.field final synthetic ̍:Ljava/lang/String;

.field final synthetic ̎:Landroid/webkit/ValueCallback;


# direct methods
.method constructor <init>(Lcom/just/agentweb/ԭ;Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/Ԯ;->̅:Lcom/just/agentweb/ԭ;

    iput-object p2, p0, Lcom/just/agentweb/Ԯ;->̍:Ljava/lang/String;

    iput-object p3, p0, Lcom/just/agentweb/Ԯ;->̎:Landroid/webkit/ValueCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/Ԯ;->̅:Lcom/just/agentweb/ԭ;

    iget-object v1, p0, Lcom/just/agentweb/Ԯ;->̍:Ljava/lang/String;

    iget-object v2, p0, Lcom/just/agentweb/Ԯ;->̎:Landroid/webkit/ValueCallback;

    invoke-virtual {v0, v1, v2}, Lcom/just/agentweb/ԭ;->̙(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
