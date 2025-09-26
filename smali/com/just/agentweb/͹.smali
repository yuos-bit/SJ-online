.class Lcom/just/agentweb/͹;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͗;->̴(Ljava/lang/String;Landroid/webkit/JsResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͗;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͗;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/͹;->̅:Lcom/just/agentweb/͗;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object p1, p0, Lcom/just/agentweb/͹;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̍(Lcom/just/agentweb/͗;)Landroid/webkit/JsResult;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/just/agentweb/͗;->̫(Lcom/just/agentweb/͗;Landroid/webkit/JsResult;)V

    return-void
.end method
