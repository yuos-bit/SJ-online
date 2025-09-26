.class public Lcom/good321/sjh5/adapter/GameButtonsAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter",
        "<",
        "Lcom/good321/sjh5/adapter/\u074c;",
        ">;"
    }
.end annotation


# instance fields
.field private ̅:I

.field private ̍:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ̎:Lcom/good321/sjh5/adapter/̳;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/good321/sjh5/adapter/GameButtonsAdapter;->̍:Ljava/util/List;

    return-void
.end method

.method static synthetic ̍(Lcom/good321/sjh5/adapter/GameButtonsAdapter;)Ljava/util/List;
    .locals 4

    const-string v0, "B5E8B6C7B5C9BCC4A9C9ABF4BAF8BAC2BEEAB5EAB6FDB5F9BCC1A9F9ABF5BAF6BAF0BEDAB5D1B6C5B5C9BCCDA9F8ABF5BAF6BAFBBEDAB5EC"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x2df

    const v3, -0x5accdfd2

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D8B6F8B5C7BCFDA9CCABC5BAC5BAC0BEE4B5DBB6F8B5C3BCC2A9C8ABC9BAF6BAFDBEEBB5E9B6F8B5F7BCFD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameButtonsAdapter;->̍:Ljava/util/List;

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4a36b9ea -> :sswitch_0
        0x785b5d86 -> :sswitch_1
    .end sparse-switch
.end method

.method static synthetic ̎(Lcom/good321/sjh5/adapter/GameButtonsAdapter;)Lcom/good321/sjh5/adapter/̳;
    .locals 4

    const-string v0, "B5E9B6C1B5C0BCFDA9F5ABF4BAF7BAC3BEEBB5EFB6CAB5FABCCDA9F6ABCDBAC5BAF1BEEA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x168

    const v3, -0x51dc415b

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5E7B6FBB5C3BCFFA9CFABF7BACABAC3BEE8B5DBB6F7B5F7BCFEA9CFABCCBAF1BAF0BEEEB5D8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameButtonsAdapter;->̎:Lcom/good321/sjh5/adapter/̳;

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x3f8c0ff7 -> :sswitch_0
        0x5ade02b7 -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method public native getItemCount()I
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    const-string v0, "B5D5B6CAB5C7BCFDA9F1ABC8BAC9BAC1BEEEB5D1B6F9B5C0BCFCA9C8ABF5BAC9BAC0BEEAB5E8B6C7B5F9BCFDA9F6ABCFBAC9BAFBBEEAB5D8B6FDB5C9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x75

    const v3, -0x62c9843e

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5DCB6C4B5C0BCFAA9C9ABF6BAF8BAC2BED2B5D2B6F7B5F8BCC2A9F1ABF2BAF2BAC6BED4"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D1B6C7B5C5BCF9A9CAABC5BAF6BAC0BEEBB5EFB6FEB5C7BCC0A9CEABF7BAC8BAF0BED2B5E6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5D6B6C7B5C7BCC3A9C5ABCCBAF6BACCBED6B5E7B6FEB5C4BCC4A9CBABCDBAF8BAFFBED4B5E7B6C1B5C6BCC2A9F1ABF6BACCBAFFBEE8B5E6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    move-object v0, p1

    check-cast v0, Lcom/good321/sjh5/adapter/݌;

    invoke-virtual {p0, v0, p2}, Lcom/good321/sjh5/adapter/GameButtonsAdapter;->onBindViewHolder(Lcom/good321/sjh5/adapter/݌;I)V

    const-string v0, "B5D2B6C5B5CDBCFAA9F1ABF7BAF8BAC1BED7B5D2B6C6B5C4BCFDA9CFABC6BAC6BAFFBEE5B5ECB6C1"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x4e7fbf8a -> :sswitch_3
        0x17121ae -> :sswitch_1
        0x1eb41473 -> :sswitch_4
        0x3990455e -> :sswitch_2
        0x60b2fc36 -> :sswitch_0
    .end sparse-switch
.end method

.method public native onBindViewHolder(Lcom/good321/sjh5/adapter/݌;I)V
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 4

    const-string v0, "B5D8B6FEB5F9BCFDA9C6ABC1BAF1BAFFBED5B5D1B6F9B5C5BCC3A9F2ABF5BAC2BAF8BEDAB5E8B6F9B5C5BCF9A9C5ABC1BAC8BACBBEDAB5EA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x3c3

    const v3, 0x3025fd82

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D5B6C1B5C1BCC4A9CBABCBBAF6BAC0BEE4B5E6B6F9B5CDBCFEA9C6ABF5BAC8BAF0BED5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D1B6C1B5C7BCFDA9C5ABF7BACCBAFDBEEAB5D1B6F9B5C9BCFAA9CFABCBBAF5BAC7BEEBB5E7B6C4B5C9BCC4A9F6ABF5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5EBB6CDB5C3BCFFA9C6ABC8BAF9BAC3BEE9B5D5B6FEB5C4BCFDA9F9ABF5BAC5BAFDBED9B5ECB6F9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p0, p1, p2}, Lcom/good321/sjh5/adapter/GameButtonsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/good321/sjh5/adapter/݌;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x827be7d -> :sswitch_3
        0x1b35563f -> :sswitch_0
        0x3dc026e9 -> :sswitch_2
        0x6ad30cca -> :sswitch_1
    .end sparse-switch
.end method

.method public native onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/good321/sjh5/adapter/݌;
.end method

.method public native setOnItemClickListener(Lcom/good321/sjh5/adapter/̳;)V
.end method

.method public native ̖(I)V
.end method
