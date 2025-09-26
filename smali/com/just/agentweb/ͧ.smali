.class Lcom/just/agentweb/ͧ;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͗;->̵(Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͗;

.field final synthetic ̍:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͗;Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ͧ;->̅:Lcom/just/agentweb/͗;

    iput-object p2, p0, Lcom/just/agentweb/ͧ;->̍:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/just/agentweb/ͧ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̯(Lcom/just/agentweb/͗;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/just/agentweb/̷;->̩(Landroid/app/Dialog;)V

    iget-object p1, p0, Lcom/just/agentweb/ͧ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̬(Lcom/just/agentweb/͗;)Landroid/webkit/JsPromptResult;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/ͧ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̬(Lcom/just/agentweb/͗;)Landroid/webkit/JsPromptResult;

    move-result-object p1

    iget-object p2, p0, Lcom/just/agentweb/ͧ;->̍:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
