.class Lcom/just/agentweb/ͮ;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͗;->̳(Landroid/os/Handler$Callback;)V
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

    iput-object p1, p0, Lcom/just/agentweb/ͮ;->̅:Lcom/just/agentweb/͗;

    iput-object p2, p0, Lcom/just/agentweb/ͮ;->̍:Landroid/os/Handler$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_0
    iget-object p1, p0, Lcom/just/agentweb/ͮ;->̍:Landroid/os/Handler$Callback;

    if-eqz p1, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object p2

    invoke-interface {p1, p2}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method
