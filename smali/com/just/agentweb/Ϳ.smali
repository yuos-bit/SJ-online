.class Lcom/just/agentweb/Ϳ;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    iput-object p1, p0, Lcom/just/agentweb/Ϳ;->̅:Lcom/just/agentweb/͗;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/just/agentweb/Ϳ;->̅:Lcom/just/agentweb/͗;

    iget-object p2, p1, Lcom/just/agentweb/͗;->̔:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1, p2}, Lcom/just/agentweb/̷;->̩(Landroid/app/Dialog;)V

    iget-object p1, p0, Lcom/just/agentweb/Ϳ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̍(Lcom/just/agentweb/͗;)Landroid/webkit/JsResult;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/Ϳ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̍(Lcom/just/agentweb/͗;)Landroid/webkit/JsResult;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/JsResult;->confirm()V

    :cond_0
    return-void
.end method
