.class Lcom/just/agentweb/͚;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͙;->onBindViewHolder(Lcom/just/agentweb/ވ;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͙;

.field final synthetic ̍:I


# direct methods
.method constructor <init>(Lcom/just/agentweb/͙;I)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/͚;->̅:Lcom/just/agentweb/͙;

    iput p2, p0, Lcom/just/agentweb/͚;->̍:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/just/agentweb/͚;->̅:Lcom/just/agentweb/͙;

    iget-object p1, p1, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    invoke-static {p1}, Lcom/just/agentweb/DefaultDesignUIController;->̬(Lcom/just/agentweb/DefaultDesignUIController;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/͚;->̅:Lcom/just/agentweb/͙;

    iget-object p1, p1, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    invoke-static {p1}, Lcom/just/agentweb/DefaultDesignUIController;->̬(Lcom/just/agentweb/DefaultDesignUIController;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/͚;->̅:Lcom/just/agentweb/͙;

    iget-object p1, p1, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    invoke-static {p1}, Lcom/just/agentweb/DefaultDesignUIController;->̬(Lcom/just/agentweb/DefaultDesignUIController;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->dismiss()V

    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object p1

    iget v0, p0, Lcom/just/agentweb/͚;->̍:I

    iput v0, p1, Landroid/os/Message;->what:I

    iget-object v0, p0, Lcom/just/agentweb/͚;->̅:Lcom/just/agentweb/͙;

    iget-object v0, v0, Lcom/just/agentweb/͙;->̍:Landroid/os/Handler$Callback;

    invoke-interface {v0, p1}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    return-void
.end method
