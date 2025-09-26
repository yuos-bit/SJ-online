.class public abstract Lcom/just/agentweb/̷;
.super Ljava/lang/Object;


# static fields
.field public static ̅:Z


# instance fields
.field protected ̍:Ljava/lang/String;

.field private ̎:Landroid/app/Activity;

.field protected ̐:Lcom/just/agentweb/̷;

.field private volatile ̒:Z

.field private ̓:Lcom/just/agentweb/WebParentLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    :try_start_0
    const-string v0, "0D1F004F090E08021E0B5E0C0F0A13080C16401D0C150B130E041E400303000D0A050400402303000D0A050400"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const-string v0, "0D1F004F090E08021E0B5E0C0F0A13080C16401D0C150B130E041E401202151A0E0A161A0B15194F2C0E13111D032305040B15230C13021F0A"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/just/agentweb/̷;->̅:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    sput-boolean v1, Lcom/just/agentweb/̷;->̅:Z

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/just/agentweb/̷;->̒:Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/̷;->̍:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected abstract ̎(Lcom/just/agentweb/WebParentLayout;Landroid/app/Activity;)V
.end method

.method final declared-synchronized ̐(Lcom/just/agentweb/WebParentLayout;Landroid/app/Activity;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/just/agentweb/̷;->̒:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/just/agentweb/̷;->̒:Z

    iput-object p1, p0, Lcom/just/agentweb/̷;->̓:Lcom/just/agentweb/WebParentLayout;

    iput-object p2, p0, Lcom/just/agentweb/̷;->̎:Landroid/app/Activity;

    invoke-virtual {p0, p1, p2}, Lcom/just/agentweb/̷;->̎(Lcom/just/agentweb/WebParentLayout;Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected ̒()Lcom/just/agentweb/̷;
    .locals 1

    sget-boolean v0, Lcom/just/agentweb/̷;->̅:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/just/agentweb/DefaultDesignUIController;

    invoke-direct {v0}, Lcom/just/agentweb/DefaultDesignUIController;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/just/agentweb/͗;

    invoke-direct {v0}, Lcom/just/agentweb/͗;-><init>()V

    :goto_0
    return-object v0
.end method

.method protected ̓()Lcom/just/agentweb/̷;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̷;->̐:Lcom/just/agentweb/̷;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/just/agentweb/̷;->̒()Lcom/just/agentweb/̷;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/̷;->̐:Lcom/just/agentweb/̷;

    :cond_0
    return-object v0
.end method

.method public abstract ̔()V
.end method

.method public abstract ̕(Ljava/lang/String;Landroid/os/Handler$Callback;)V
.end method

.method public abstract ̖(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract ̗(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)V
.end method

.method public abstract ̘(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)V
.end method

.method public abstract ̙(Ljava/lang/String;)V
.end method

.method public abstract ̚(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract ̜(Landroid/webkit/WebView;Ljava/lang/String;Landroid/os/Handler$Callback;)V
.end method

.method public abstract ̝(Landroid/webkit/PermissionRequest;)V
.end method

.method public abstract ̞([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract ̟(Landroid/webkit/WebView;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Handler$Callback;)V
.end method

.method public abstract ̠()V
.end method

.method public abstract ̡(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract ̢(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
.end method

.method protected ̩(Landroid/app/Dialog;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method protected ̪(Landroid/app/Dialog;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    :cond_0
    return-void
.end method
