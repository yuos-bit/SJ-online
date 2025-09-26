.class Lcom/just/agentweb/ͯ;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͗;->̶([Ljava/lang/String;Landroid/os/Handler$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͗;

.field final synthetic ̍:Landroid/os/Handler$Callback;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͗;Landroid/os/Handler$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ͯ;->̅:Lcom/just/agentweb/͗;

    iput-object p2, p0, Lcom/just/agentweb/ͯ;->̍:Landroid/os/Handler$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object p1, p0, Lcom/just/agentweb/ͯ;->̍:Landroid/os/Handler$Callback;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method
