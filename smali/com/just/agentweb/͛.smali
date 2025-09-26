.class public Lcom/just/agentweb/͛;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/webkit/DownloadListener;


# static fields
.field private static final ̅:Ljava/lang/String;

.field private static ̍:Landroid/os/Handler;


# instance fields
.field private ̎:Z

.field protected ̐:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field protected ̒:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/just/agentweb/\u0337;",
            ">;"
        }
    .end annotation
.end field

.field protected ̓:Landroid/content/Context;

.field protected ̔:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/download/library/ResourceRequest;",
            ">;"
        }
    .end annotation
.end field

.field protected ̕:Lcom/just/agentweb/֋;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/just/agentweb/͛;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/͛;->̅:Ljava/lang/String;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/just/agentweb/͛;->̍:Landroid/os/Handler;

    return-void
.end method

.method protected constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/just/agentweb/֋;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/just/agentweb/͛;->̔:Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/just/agentweb/͛;->̕:Lcom/just/agentweb/֋;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/just/agentweb/͛;->̕:Lcom/just/agentweb/֋;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-static {p2}, Lcom/just/agentweb/͎;->̡(Landroid/webkit/WebView;)Lcom/just/agentweb/̷;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    :try_start_0
    iget-object p1, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    invoke-static {p1}, Lcom/download/library/DownloadImpl;->getInstance(Landroid/content/Context;)Lcom/download/library/DownloadImpl;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/just/agentweb/͛;->̎:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    sget-object p2, Lcom/just/agentweb/͛;->̅:Ljava/lang/String;

    const-string p3, "071D1D0D0B0C020B060F04040E004140061D035E090E190F0B0A130A5E01080C1306170B54340216000D0804160B0257194019491D55"

    invoke-static {p3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/just/agentweb/͛;->̎:Z

    :goto_0
    return-void
.end method

.method static synthetic ̎()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/just/agentweb/͛;->̅:Ljava/lang/String;

    return-object v0
.end method

.method public static ̐(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/just/agentweb/֋;)Lcom/just/agentweb/͛;
    .locals 1

    new-instance v0, Lcom/just/agentweb/͛;

    invoke-direct {v0, p0, p1, p2}, Lcom/just/agentweb/͛;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/just/agentweb/֋;)V

    return-object v0
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 11

    move-object v8, p0

    iget-boolean v0, v8, Lcom/just/agentweb/͛;->̎:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/just/agentweb/͛;->̅:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "1B1E0C0302044716060F0219410A0E100B1E01110941"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "5550040C1E0D02081700040C15070E0945550D1F004F0A0E100B1E0111094F02080517131C095725011609091D0F1408135419491D5C1657"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    move-object v2, p1

    sget-object v9, Lcom/just/agentweb/͛;->̍:Landroid/os/Handler;

    new-instance v10, Lcom/just/agentweb/ͣ;

    move-object v0, v10

    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/just/agentweb/ͣ;-><init>(Lcom/just/agentweb/͛;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected ̒()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    sget-object v2, Lcom/just/agentweb/͍;->̓:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/just/agentweb/͎;->̿(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-object v0
.end method

.method protected ̓(Ljava/lang/String;)Landroid/os/Handler$Callback;
    .locals 1

    new-instance v0, Lcom/just/agentweb/ͤ;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/ͤ;-><init>(Lcom/just/agentweb/͛;Ljava/lang/String;)V

    return-object v0
.end method

.method protected ̔(Ljava/lang/String;)Lcom/download/library/ResourceRequest;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    invoke-static {v0}, Lcom/download/library/DownloadImpl;->getInstance(Landroid/content/Context;)Lcom/download/library/DownloadImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/download/library/DownloadImpl;->with(Ljava/lang/String;)Lcom/download/library/ResourceRequest;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/download/library/ResourceRequest;->setEnableIndicator(Z)Lcom/download/library/ResourceRequest;

    move-result-object p1

    invoke-virtual {p1}, Lcom/download/library/ResourceRequest;->autoOpenIgnoreMD5()Lcom/download/library/ResourceRequest;

    move-result-object p1

    return-object p1
.end method

.method protected ̕(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/͛;->̔:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/download/library/ResourceRequest;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/download/library/ResourceRequest;->setForceDownload(Z)Lcom/download/library/ResourceRequest;

    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̚(Ljava/lang/String;)V

    return-void
.end method

.method protected ̖(Ljava/lang/String;)Lcom/just/agentweb/̼;
    .locals 1

    new-instance v0, Lcom/just/agentweb/މ;

    invoke-direct {v0, p0, p1}, Lcom/just/agentweb/މ;-><init>(Lcom/just/agentweb/͛;Ljava/lang/String;)V

    return-object v0
.end method

.method protected ̗(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/͛;->̔:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/download/library/ResourceRequest;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/download/library/ResourceRequest;->getDownloadTask()Lcom/download/library/DownloadTask;

    move-result-object p1

    invoke-virtual {p1}, Lcom/download/library/DownloadTask;->isForceDownload()Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected ̙(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    iget-object p2, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_1

    :cond_0
    iget-object p2, p0, Lcom/just/agentweb/͛;->̕:Lcom/just/agentweb/֋;

    if-eqz p2, :cond_1

    sget-object p3, Lcom/just/agentweb/͍;->̓:[Ljava/lang/String;

    const-string p4, "0A1F1A0F020E0601"

    invoke-static {p4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-interface {p2, p1, p3, p4}, Lcom/just/agentweb/֋;->̓(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̔(Ljava/lang/String;)Lcom/download/library/ResourceRequest;

    move-result-object p2

    iget-object p3, p0, Lcom/just/agentweb/͛;->̔:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x17

    if-lt p2, p3, :cond_3

    invoke-virtual {p0}, Lcom/just/agentweb/͛;->̒()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_2

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    new-array p3, p3, [Ljava/lang/String;

    invoke-interface {p2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-static {p2}, Lcom/just/agentweb/̹;->̍([Ljava/lang/String;)Lcom/just/agentweb/̹;

    move-result-object p2

    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̖(Ljava/lang/String;)Lcom/just/agentweb/̼;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/just/agentweb/̹;->̝(Lcom/just/agentweb/̼;)V

    iget-object p1, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1, p2}, Lcom/just/agentweb/AgentActionFragment;->̗(Landroid/app/Activity;Lcom/just/agentweb/̹;)V

    goto :goto_1

    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̜(Ljava/lang/String;)V

    :cond_4
    :goto_1
    return-void
.end method

.method protected ̚(Ljava/lang/String;)V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/just/agentweb/͛;->̅:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "1E151F0701130A211D191E010E0F055D"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E1515081D155D"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    invoke-static {v2}, Lcom/download/library/DownloadImpl;->getInstance(Landroid/content/Context;)Lcom/download/library/DownloadImpl;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/download/library/DownloadImpl;->exist(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    invoke-static {v0}, Lcom/download/library/DownloadImpl;->getInstance(Landroid/content/Context;)Lcom/download/library/DownloadImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/download/library/DownloadImpl;->exist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/just/agentweb/̷;

    iget-object v0, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    sget v1, Lcom/just/agentweb/׍;->͂:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1E020825011609091D0F14"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/just/agentweb/̷;->̡(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/just/agentweb/͛;->̔:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/download/library/ResourceRequest;

    const-string v1, "2D1F020A0704"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/just/agentweb/͈;->̕(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/download/library/ResourceRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/download/library/ResourceRequest;

    invoke-virtual {p0, v0}, Lcom/just/agentweb/͛;->̞(Lcom/download/library/ResourceRequest;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    :goto_0
    return-void
.end method

.method protected ̜(Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̗(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/͛;->̓:Landroid/content/Context;

    invoke-static {v0}, Lcom/just/agentweb/͎;->̐(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̝(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̚(Ljava/lang/String;)V

    return-void
.end method

.method protected ̝(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/͛;->̐:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/͛;->̒:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/just/agentweb/̷;

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/just/agentweb/͛;->̓(Ljava/lang/String;)Landroid/os/Handler$Callback;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/just/agentweb/̷;->̕(Ljava/lang/String;Landroid/os/Handler$Callback;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected ̞(Lcom/download/library/ResourceRequest;)V
    .locals 1

    new-instance v0, Lcom/just/agentweb/ͥ;

    invoke-direct {v0, p0}, Lcom/just/agentweb/ͥ;-><init>(Lcom/just/agentweb/͛;)V

    invoke-virtual {p1, v0}, Lcom/download/library/ResourceRequest;->enqueue(Lcom/download/library/DownloadListenerAdapter;)V

    return-void
.end method
