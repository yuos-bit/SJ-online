.class Lcom/just/agentweb/އ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/̼;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/ޅ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/ޅ;


# direct methods
.method constructor <init>(Lcom/just/agentweb/ޅ;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ̒([Ljava/lang/String;[ILandroid/os/Bundle;)V
    .locals 2

    const-string p2, "2535343E283328282D273E392420352E2A3C"

    invoke-static {p2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p2

    const/16 p3, 0x60

    if-ne p2, p3, :cond_2

    iget-object p2, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p2}, Lcom/just/agentweb/ޅ;->̍(Lcom/just/agentweb/ޅ;)Ljava/lang/ref/WeakReference;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    invoke-static {p2, p1}, Lcom/just/agentweb/͎;->̿(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result p1

    iget-object p2, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p2}, Lcom/just/agentweb/ޅ;->̓(Lcom/just/agentweb/ޅ;)Landroid/webkit/GeolocationPermissions$Callback;

    move-result-object p2

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    iget-object p3, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p3}, Lcom/just/agentweb/ޅ;->̓(Lcom/just/agentweb/ޅ;)Landroid/webkit/GeolocationPermissions$Callback;

    move-result-object p3

    iget-object v0, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {v0}, Lcom/just/agentweb/ޅ;->̕(Lcom/just/agentweb/ޅ;)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    invoke-interface {p3, v0, v1, p2}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    goto :goto_0

    :cond_0
    invoke-interface {p3, v0, p2, p2}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    :goto_0
    iget-object p2, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    const/4 p3, 0x0

    invoke-static {p2, p3}, Lcom/just/agentweb/ޅ;->̔(Lcom/just/agentweb/ޅ;Landroid/webkit/GeolocationPermissions$Callback;)Landroid/webkit/GeolocationPermissions$Callback;

    iget-object p2, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p2, p3}, Lcom/just/agentweb/ޅ;->̖(Lcom/just/agentweb/ޅ;Ljava/lang/String;)Ljava/lang/String;

    :cond_1
    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p1}, Lcom/just/agentweb/ޅ;->̗(Lcom/just/agentweb/ޅ;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/just/agentweb/އ;->̅:Lcom/just/agentweb/ޅ;

    invoke-static {p1}, Lcom/just/agentweb/ޅ;->̗(Lcom/just/agentweb/ޅ;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/just/agentweb/̷;

    sget-object p2, Lcom/just/agentweb/͍;->̒:[Ljava/lang/String;

    const-string p3, "221F0E001A08080B"

    invoke-static {p3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3, p3}, Lcom/just/agentweb/̷;->̞([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
