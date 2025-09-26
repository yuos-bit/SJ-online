.class Lcom/just/agentweb/މ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/̼;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͛;->̖(Ljava/lang/String;)Lcom/just/agentweb/̼;
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

    iput-object p1, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    iput-object p2, p0, Lcom/just/agentweb/މ;->̍:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ̒([Ljava/lang/String;[ILandroid/os/Bundle;)V
    .locals 1

    iget-object p1, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    invoke-virtual {p1}, Lcom/just/agentweb/͛;->̒()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    iget-object p2, p0, Lcom/just/agentweb/މ;->̍:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/just/agentweb/͛;->̜(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    iget-object p1, p1, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    iget-object p1, p1, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/just/agentweb/̷;

    iget-object p2, p0, Lcom/just/agentweb/މ;->̅:Lcom/just/agentweb/͛;

    invoke-virtual {p2}, Lcom/just/agentweb/͛;->̒()Ljava/util/List;

    move-result-object p2

    const/4 p3, 0x0

    new-array p3, p3, [Ljava/lang/String;

    invoke-interface {p2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    const-string p3, "3D0402130F0602"

    invoke-static {p3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "Download"

    invoke-virtual {p1, p2, p3, v0}, Lcom/just/agentweb/̷;->̞([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-static {}, Lcom/just/agentweb/͛;->̎()Ljava/lang/String;

    move-result-object p1

    const-string p2, "8BF2C584C3F981F8F187E9FD89E0D682EAE48BD4DC89DAC419"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
