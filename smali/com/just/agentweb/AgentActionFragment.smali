.class public final Lcom/just/agentweb/AgentActionFragment;
.super Landroidx/fragment/app/Fragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/just/agentweb/̻;,
        Lcom/just/agentweb/̼;,
        Lcom/just/agentweb/̽;
    }
.end annotation


# static fields
.field public static final ̅:Ljava/lang/String; = "AgentWebActionFragment"

.field public static final ̍:Ljava/lang/String; = "KEY_FROM_INTENTION"

.field public static final ̎:Ljava/lang/String; = "KEY_URI"

.field public static final ̐:I = 0x254

.field private static final ̒:Ljava/lang/String;


# instance fields
.field private ̓:Z

.field private ̔:Lcom/just/agentweb/̹;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/just/agentweb/AgentActionFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/AgentActionFragment;->̒:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/just/agentweb/AgentActionFragment;->̓:Z

    return-void
.end method

.method private ̎()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x254

    :try_start_0
    iget-object v3, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v3}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/just/agentweb/͎;->̜(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_1

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v4}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v4

    invoke-interface {v4, v2, v1, v0}, Lcom/just/agentweb/̻;->̐(IILandroid/content/Intent;)V

    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/just/agentweb/͎;->̴(Landroid/content/Context;Ljava/io/File;)Landroid/content/Intent;

    move-result-object v3

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    const-string v5, "010519111B15"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lcom/just/agentweb/̹;->̡(Landroid/net/Uri;)V

    invoke-virtual {p0, v3, v2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v3

    sget-object v4, Lcom/just/agentweb/AgentActionFragment;->̒:Ljava/lang/String;

    const-string v5, "88F9D385D6EC82EDC289C3D686D5FE80FECA88ECD7"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v4}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v4}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v4

    invoke-interface {v4, v2, v1, v0}, Lcom/just/agentweb/̻;->̐(IILandroid/content/Intent;)V

    :cond_2
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3
    :goto_0
    return-void
.end method

.method private ̐()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̓()Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_1
    const/16 v1, 0x254

    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/just/agentweb/AgentActionFragment;->̒:Ljava/lang/String;

    const-string v2, "88F9D385D6EC82EDC288E6EA85D5D78EE5FB88FBC484F7C9"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/just/agentweb/AgentActionFragment;->̒(ILandroid/content/Intent;)V

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    :goto_0
    return-void
.end method

.method private ̒(ILandroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v0

    const/16 v1, 0x254

    invoke-interface {v0, v1, p1, p2}, Lcom/just/agentweb/̻;->̐(IILandroid/content/Intent;)V

    :cond_0
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void
.end method

.method private ̓()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x254

    :try_start_0
    iget-object v3, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v3}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/just/agentweb/͎;->̝(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v3}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v3

    invoke-interface {v3, v2, v1, v0}, Lcom/just/agentweb/̻;->̐(IILandroid/content/Intent;)V

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/just/agentweb/͎;->̵(Landroid/content/Context;Ljava/io/File;)Landroid/content/Intent;

    move-result-object v3

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    const-string v5, "010519111B15"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lcom/just/agentweb/̹;->̡(Landroid/net/Uri;)V

    invoke-virtual {p0, v3, v2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v3

    sget-object v4, Lcom/just/agentweb/AgentActionFragment;->̒:Ljava/lang/String;

    const-string v5, "88F9D385D6EC82EDC289C3D686D5FE80FECA88ECD7"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/just/agentweb/ֈ;->̍(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v4}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v4}, Lcom/just/agentweb/̹;->̐()Lcom/just/agentweb/̻;

    move-result-object v4

    invoke-interface {v4, v2, v1, v0}, Lcom/just/agentweb/̻;->̐(IILandroid/content/Intent;)V

    :cond_2
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3
    :goto_0
    return-void
.end method

.method private ̔(Lcom/just/agentweb/̹;)V
    .locals 2

    invoke-virtual {p1}, Lcom/just/agentweb/̹;->̕()Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/just/agentweb/͎;->ͅ(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̖()Lcom/just/agentweb/̽;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_2
    iget-object p1, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {p1}, Lcom/just/agentweb/̹;->̖()Lcom/just/agentweb/̽;

    move-result-object p1

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-interface {p1, v1, v0}, Lcom/just/agentweb/̽;->̓(ZLandroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_3
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̔()Lcom/just/agentweb/̼;

    move-result-object v0

    if-eqz v0, :cond_4

    new-array v0, v1, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->requestPermissions([Ljava/lang/String;I)V

    :cond_4
    return-void
.end method

.method private ̕()V
    .locals 0

    return-void
.end method

.method private ̖()V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̎()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-direct {p0, v0}, Lcom/just/agentweb/AgentActionFragment;->̔(Lcom/just/agentweb/̹;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̎()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̎()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̎()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̓()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̐()V

    :goto_0
    return-void
.end method

.method public static ̗(Landroid/app/Activity;Lcom/just/agentweb/̹;)V
    .locals 2

    check-cast p0, Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "2F17080F1A360207330D04040E002715041503150315"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/just/agentweb/AgentActionFragment;

    if-nez v1, :cond_0

    new-instance v1, Lcom/just/agentweb/AgentActionFragment;

    invoke-direct {v1}, Lcom/just/agentweb/AgentActionFragment;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    :cond_0
    iput-object p1, v1, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    iget-boolean p0, v1, Lcom/just/agentweb/AgentActionFragment;->̓:Z

    if-eqz p0, :cond_1

    invoke-direct {v1}, Lcom/just/agentweb/AgentActionFragment;->̖()V

    :cond_1
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x254

    if-ne p1, v1, :cond_2

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̗()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p3, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {p3}, Lcom/just/agentweb/̹;->̗()Landroid/net/Uri;

    move-result-object p3

    const-string v0, "2535343E3B332E"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lcom/just/agentweb/AgentActionFragment;->̒(ILandroid/content/Intent;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/just/agentweb/AgentActionFragment;->̒(ILandroid/content/Intent;)V

    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    sget-object v0, Lcom/just/agentweb/AgentActionFragment;->̒:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "1D111B040A280916060F1E0E043D1506111754"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/just/agentweb/ֈ;->̐(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/just/agentweb/AgentActionFragment;->̓:Z

    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̖()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2

    iget-object p1, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {p1}, Lcom/just/agentweb/̹;->̔()Lcom/just/agentweb/̼;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̒()I

    move-result v0

    const-string v1, "2535343E283328282D273E392420352E2A3C"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/just/agentweb/AgentActionFragment;->̔:Lcom/just/agentweb/̹;

    invoke-virtual {v0}, Lcom/just/agentweb/̹;->̔()Lcom/just/agentweb/̼;

    move-result-object v0

    invoke-interface {v0, p2, p3, p1}, Lcom/just/agentweb/̼;->̒([Ljava/lang/String;[ILandroid/os/Bundle;)V

    :cond_0
    invoke-direct {p0}, Lcom/just/agentweb/AgentActionFragment;->̕()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method
