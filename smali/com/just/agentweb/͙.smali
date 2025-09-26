.class Lcom/just/agentweb/͙;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/just/agentweb/DefaultDesignUIController;->̳([Ljava/lang/String;Landroid/os/Handler$Callback;)Landroidx/recyclerview/widget/RecyclerView$Adapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/just/agentweb/\u0788;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic ̅:Lcom/just/agentweb/DefaultDesignUIController;

.field final synthetic ̍:Landroid/os/Handler$Callback;

.field final synthetic ̎:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/just/agentweb/DefaultDesignUIController;[Ljava/lang/String;Landroid/os/Handler$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    iput-object p2, p0, Lcom/just/agentweb/͙;->̎:[Ljava/lang/String;

    iput-object p3, p0, Lcom/just/agentweb/͙;->̍:Landroid/os/Handler$Callback;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/͙;->̎:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/just/agentweb/ވ;

    invoke-virtual {p0, p1, p2}, Lcom/just/agentweb/͙;->onBindViewHolder(Lcom/just/agentweb/ވ;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/just/agentweb/ވ;I)V
    .locals 4

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    iget-object v1, p0, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    invoke-static {v1}, Lcom/just/agentweb/DefaultDesignUIController;->̫(Lcom/just/agentweb/DefaultDesignUIController;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x101030e

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget-object v1, p1, Lcom/just/agentweb/ވ;->̅:Landroid/widget/TextView;

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    iget-object v0, p1, Lcom/just/agentweb/ވ;->̅:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/just/agentweb/͙;->̎:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lcom/just/agentweb/ވ;->̅:Landroid/widget/TextView;

    new-instance v0, Lcom/just/agentweb/͚;

    invoke-direct {v0, p0, p2}, Lcom/just/agentweb/͚;-><init>(Lcom/just/agentweb/͙;I)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/just/agentweb/͙;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/just/agentweb/ވ;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/just/agentweb/ވ;
    .locals 3

    new-instance p2, Lcom/just/agentweb/ވ;

    iget-object v0, p0, Lcom/just/agentweb/͙;->̅:Lcom/just/agentweb/DefaultDesignUIController;

    invoke-static {v0}, Lcom/just/agentweb/DefaultDesignUIController;->̍(Lcom/just/agentweb/DefaultDesignUIController;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x1090003

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/just/agentweb/ވ;-><init>(Landroid/view/View;)V

    return-object p2
.end method
