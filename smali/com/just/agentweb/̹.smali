.class public final Lcom/just/agentweb/̹;
.super Ljava/lang/Object;


# static fields
.field public static final transient ̅:I = 0x3

.field public static final transient ̍:I = 0x2

.field public static final transient ̎:I = 0x1

.field public static final transient ̐:I = 0x4


# instance fields
.field private ̒:I

.field private ̓:Lcom/just/agentweb/̻;

.field private ̔:I

.field private ̕:Landroid/content/Intent;

.field private ̖:Lcom/just/agentweb/̼;

.field private ̗:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ̘:Lcom/just/agentweb/̽;

.field private ̙:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/just/agentweb/̹;->̗:Ljava/util/ArrayList;

    return-void
.end method

.method public static ̍([Ljava/lang/String;)Lcom/just/agentweb/̹;
    .locals 2

    new-instance v0, Lcom/just/agentweb/̹;

    invoke-direct {v0}, Lcom/just/agentweb/̹;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/just/agentweb/̹;->̘(I)V

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/just/agentweb/̹;->̞(Ljava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public ̎()I
    .locals 1

    iget v0, p0, Lcom/just/agentweb/̹;->̒:I

    return v0
.end method

.method public ̐()Lcom/just/agentweb/̻;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̹;->̓:Lcom/just/agentweb/̻;

    return-object v0
.end method

.method public ̒()I
    .locals 1

    iget v0, p0, Lcom/just/agentweb/̹;->̔:I

    return v0
.end method

.method public ̓()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̹;->̕:Landroid/content/Intent;

    return-object v0
.end method

.method public ̔()Lcom/just/agentweb/̼;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̹;->̖:Lcom/just/agentweb/̼;

    return-object v0
.end method

.method public ̕()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/just/agentweb/̹;->̗:Ljava/util/ArrayList;

    return-object v0
.end method

.method public ̖()Lcom/just/agentweb/̽;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̹;->̘:Lcom/just/agentweb/̽;

    return-object v0
.end method

.method public ̗()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/̹;->̙:Landroid/net/Uri;

    return-object v0
.end method

.method public ̘(I)V
    .locals 0

    iput p1, p0, Lcom/just/agentweb/̹;->̒:I

    return-void
.end method

.method public ̙(Lcom/just/agentweb/̻;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/̹;->̓:Lcom/just/agentweb/̻;

    return-void
.end method

.method public ̚(I)Lcom/just/agentweb/̹;
    .locals 0

    iput p1, p0, Lcom/just/agentweb/̹;->̔:I

    return-object p0
.end method

.method public ̜(Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/̹;->̕:Landroid/content/Intent;

    return-void
.end method

.method public ̝(Lcom/just/agentweb/̼;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/̹;->̖:Lcom/just/agentweb/̼;

    return-void
.end method

.method public ̞(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/just/agentweb/̹;->̗:Ljava/util/ArrayList;

    return-void
.end method

.method public ̞([Ljava/lang/String;)V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/just/agentweb/̹;->̗:Ljava/util/ArrayList;

    return-void
.end method

.method public ̠(Lcom/just/agentweb/̽;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/̹;->̘:Lcom/just/agentweb/̽;

    return-void
.end method

.method public ̡(Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/̹;->̙:Landroid/net/Uri;

    return-void
.end method
