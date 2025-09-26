.class Lcom/just/agentweb/ފ;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/just/agentweb/̼;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/͗;->̝(Landroid/webkit/PermissionRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/͗;

.field final synthetic ̍:Ljava/util/List;

.field final synthetic ̎:Landroid/webkit/PermissionRequest;

.field final synthetic ̐:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/just/agentweb/͗;Ljava/util/List;Landroid/webkit/PermissionRequest;[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/ފ;->̅:Lcom/just/agentweb/͗;

    iput-object p2, p0, Lcom/just/agentweb/ފ;->̍:Ljava/util/List;

    iput-object p3, p0, Lcom/just/agentweb/ފ;->̎:Landroid/webkit/PermissionRequest;

    iput-object p4, p0, Lcom/just/agentweb/ފ;->̐:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ̒([Ljava/lang/String;[ILandroid/os/Bundle;)V
    .locals 0

    iget-object p1, p0, Lcom/just/agentweb/ފ;->̅:Lcom/just/agentweb/͗;

    invoke-static {p1}, Lcom/just/agentweb/͗;->̲(Lcom/just/agentweb/͗;)Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/just/agentweb/ފ;->̍:Ljava/util/List;

    const/4 p3, 0x0

    new-array p3, p3, [Ljava/lang/String;

    invoke-interface {p2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/just/agentweb/͎;->̬(Landroid/app/Activity;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/ފ;->̎:Landroid/webkit/PermissionRequest;

    iget-object p2, p0, Lcom/just/agentweb/ފ;->̐:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/just/agentweb/ފ;->̎:Landroid/webkit/PermissionRequest;

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->deny()V

    :goto_0
    return-void
.end method
