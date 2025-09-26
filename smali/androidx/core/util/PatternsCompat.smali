.class public final Landroidx/core/util/PatternsCompat;
.super Ljava/lang/Object;


# static fields
.field public static final AUTOLINK_EMAIL_ADDRESS:Ljava/util/regex/Pattern;

.field public static final AUTOLINK_WEB_URL:Ljava/util/regex/Pattern;

.field public static final DOMAIN_NAME:Ljava/util/regex/Pattern;

.field public static final EMAIL_ADDRESS:Ljava/util/regex/Pattern;

.field private static final EMAIL_ADDRESS_DOMAIN:Ljava/lang/String; = "(?=.{1,255}(?:\\s|$|^))([a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]](?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]_\\-]{0,61}[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]){0,1}\\.)+(xn\\-\\-[\\w\\-]{0,58}\\w|[a-zA-Z[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]{2,63})"

.field private static final EMAIL_ADDRESS_LOCAL_PART:Ljava/lang/String; = "[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]\\+\\-_%\'](?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]\\+\\-_%\'\\.]{0,62}[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]\\+\\-_%\'])?"

.field private static final EMAIL_CHAR:Ljava/lang/String; = "a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]\\+\\-_%\'"

.field private static final HOST_NAME:Ljava/lang/String; = "([a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]](?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]_\\-]{0,61}[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]){0,1}\\.)+(xn\\-\\-[\\w\\-]{0,58}\\w|[a-zA-Z[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]{2,63})"

.field static final IANA_TOP_LEVEL_DOMAINS:Ljava/lang/String; = "(?:(?:aaa|aarp|abb|abbott|abogado|academy|accenture|accountant|accountants|aco|active|actor|ads|adult|aeg|aero|afl|agency|aig|airforce|airtel|allfinanz|alsace|amica|amsterdam|android|apartments|app|apple|aquarelle|aramco|archi|army|arpa|arte|asia|associates|attorney|auction|audio|auto|autos|axa|azure|a[cdefgilmoqrstuwxz])|(?:band|bank|bar|barcelona|barclaycard|barclays|bargains|bauhaus|bayern|bbc|bbva|bcn|beats|beer|bentley|berlin|best|bet|bharti|bible|bid|bike|bing|bingo|bio|biz|black|blackfriday|bloomberg|blue|bms|bmw|bnl|bnpparibas|boats|bom|bond|boo|boots|boutique|bradesco|bridgestone|broadway|broker|brother|brussels|budapest|build|builders|business|buzz|bzh|b[abdefghijmnorstvwyz])|(?:cab|cafe|cal|camera|camp|cancerresearch|canon|capetown|capital|car|caravan|cards|care|career|careers|cars|cartier|casa|cash|casino|cat|catering|cba|cbn|ceb|center|ceo|cern|cfa|cfd|chanel|channel|chat|cheap|chloe|christmas|chrome|church|cipriani|cisco|citic|city|cityeats|claims|cleaning|click|clinic|clothing|cloud|club|clubmed|coach|codes|coffee|college|cologne|com|commbank|community|company|computer|comsec|condos|construction|consulting|contractors|cooking|cool|coop|corsica|country|coupons|courses|credit|creditcard|creditunion|cricket|crown|crs|cruises|csc|cuisinella|cymru|cyou|c[acdfghiklmnoruvwxyz])|(?:dabur|dad|dance|date|dating|datsun|day|dclk|deals|degree|delivery|dell|delta|democrat|dental|dentist|desi|design|dev|diamonds|diet|digital|direct|directory|discount|dnp|docs|dog|doha|domains|doosan|download|drive|durban|dvag|d[ejkmoz])|(?:earth|eat|edu|education|email|emerck|energy|engineer|engineering|enterprises|epson|equipment|erni|esq|estate|eurovision|eus|events|everbank|exchange|expert|exposed|express|e[cegrstu])|(?:fage|fail|fairwinds|faith|family|fan|fans|farm|fashion|feedback|ferrero|film|final|finance|financial|firmdale|fish|fishing|fit|fitness|flights|florist|flowers|flsmidth|fly|foo|football|forex|forsale|forum|foundation|frl|frogans|fund|furniture|futbol|fyi|f[ijkmor])|(?:gal|gallery|game|garden|gbiz|gdn|gea|gent|genting|ggee|gift|gifts|gives|giving|glass|gle|global|globo|gmail|gmo|gmx|gold|goldpoint|golf|goo|goog|google|gop|gov|grainger|graphics|gratis|green|gripe|group|gucci|guge|guide|guitars|guru|g[abdefghilmnpqrstuwy])|(?:hamburg|hangout|haus|healthcare|help|here|hermes|hiphop|hitachi|hiv|hockey|holdings|holiday|homedepot|homes|honda|horse|host|hosting|hoteles|hotmail|house|how|hsbc|hyundai|h[kmnrtu])|(?:ibm|icbc|ice|icu|ifm|iinet|immo|immobilien|industries|infiniti|info|ing|ink|institute|insure|int|international|investments|ipiranga|irish|ist|istanbul|itau|iwc|i[delmnoqrst])|(?:jaguar|java|jcb|jetzt|jewelry|jlc|jll|jobs|joburg|jprs|juegos|j[emop])|(?:kaufen|kddi|kia|kim|kinder|kitchen|kiwi|koeln|komatsu|krd|kred|kyoto|k[eghimnprwyz])|(?:lacaixa|lancaster|land|landrover|lasalle|lat|latrobe|law|lawyer|lds|lease|leclerc|legal|lexus|lgbt|liaison|lidl|life|lifestyle|lighting|limited|limo|linde|link|live|lixil|loan|loans|lol|london|lotte|lotto|love|ltd|ltda|lupin|luxe|luxury|l[abcikrstuvy])|(?:madrid|maif|maison|man|management|mango|market|marketing|markets|marriott|mba|media|meet|melbourne|meme|memorial|men|menu|meo|miami|microsoft|mil|mini|mma|mobi|moda|moe|moi|mom|monash|money|montblanc|mormon|mortgage|moscow|motorcycles|mov|movie|movistar|mtn|mtpc|mtr|museum|mutuelle|m[acdeghklmnopqrstuvwxyz])|(?:nadex|nagoya|name|navy|nec|net|netbank|network|neustar|new|news|nexus|ngo|nhk|nico|ninja|nissan|nokia|nra|nrw|ntt|nyc|n[acefgilopruz])|(?:obi|office|okinawa|omega|one|ong|onl|online|ooo|oracle|orange|org|organic|osaka|otsuka|ovh|om)|(?:page|panerai|paris|partners|parts|party|pet|pharmacy|philips|photo|photography|photos|physio|piaget|pics|pictet|pictures|ping|pink|pizza|place|play|playstation|plumbing|plus|pohl|poker|porn|post|praxi|press|pro|prod|productions|prof|properties|property|protection|pub|p[aefghklmnrstwy])|(?:qpon|quebec|qa)|(?:racing|realtor|realty|recipes|red|redstone|rehab|reise|reisen|reit|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rich|ricoh|rio|rip|rocher|rocks|rodeo|rsvp|ruhr|run|rwe|ryukyu|r[eosuw])|(?:saarland|sakura|sale|samsung|sandvik|sandvikcoromant|sanofi|sap|sapo|sarl|saxo|sbs|sca|scb|schmidt|scholarships|school|schule|schwarz|science|scor|scot|seat|security|seek|sener|services|seven|sew|sex|sexy|shiksha|shoes|show|shriram|singles|site|ski|sky|skype|sncf|soccer|social|software|sohu|solar|solutions|sony|soy|space|spiegel|spreadbetting|srl|stada|starhub|statoil|stc|stcgroup|stockholm|studio|study|style|sucks|supplies|supply|support|surf|surgery|suzuki|swatch|swiss|sydney|systems|s[abcdeghijklmnortuvxyz])|(?:tab|taipei|tatamotors|tatar|tattoo|tax|taxi|team|tech|technology|tel|telefonica|temasek|tennis|thd|theater|theatre|tickets|tienda|tips|tires|tirol|today|tokyo|tools|top|toray|toshiba|tours|town|toyota|toys|trade|trading|training|travel|trust|tui|t[cdfghjklmnortvwz])|(?:ubs|university|uno|uol|u[agksyz])|(?:vacations|vana|vegas|ventures|versicherung|vet|viajes|video|villas|vin|virgin|vision|vista|vistaprint|viva|vlaanderen|vodka|vote|voting|voto|voyage|v[aceginu])|(?:wales|walter|wang|watch|webcam|website|wed|wedding|weir|whoswho|wien|wiki|williamhill|win|windows|wine|wme|work|works|world|wtc|wtf|w[fs])|(?:\u03b5\u03bb|\u0431\u0435\u043b|\u0434\u0435\u0442\u0438|\u043a\u043e\u043c|\u043c\u043a\u0434|\u043c\u043e\u043d|\u043c\u043e\u0441\u043a\u0432\u0430|\u043e\u043d\u043b\u0430\u0439\u043d|\u043e\u0440\u0433|\u0440\u0443\u0441|\u0440\u0444|\u0441\u0430\u0439\u0442|\u0441\u0440\u0431|\u0443\u043a\u0440|\u049b\u0430\u0437|\u0570\u0561\u0575|\u05e7\u05d5\u05dd|\u0627\u0631\u0627\u0645\u0643\u0648|\u0627\u0644\u0627\u0631\u062f\u0646|\u0627\u0644\u062c\u0632\u0627\u0626\u0631|\u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629|\u0627\u0644\u0645\u063a\u0631\u0628|\u0627\u0645\u0627\u0631\u0627\u062a|\u0627\u06cc\u0631\u0627\u0646|\u0628\u0627\u0632\u0627\u0631|\u0628\u06be\u0627\u0631\u062a|\u062a\u0648\u0646\u0633|\u0633\u0648\u062f\u0627\u0646|\u0633\u0648\u0631\u064a\u0629|\u0634\u0628\u0643\u0629|\u0639\u0631\u0627\u0642|\u0639\u0645\u0627\u0646|\u0641\u0644\u0633\u0637\u064a\u0646|\u0642\u0637\u0631|\u0643\u0648\u0645|\u0645\u0635\u0631|\u0645\u0644\u064a\u0633\u064a\u0627|\u0645\u0648\u0642\u0639|\u0915\u0949\u092e|\u0928\u0947\u091f|\u092d\u093e\u0930\u0924|\u0938\u0902\u0917\u0920\u0928|\u09ad\u09be\u09b0\u09a4|\u0a2d\u0a3e\u0a30\u0a24|\u0aad\u0abe\u0ab0\u0aa4|\u0b87\u0ba8\u0bcd\u0ba4\u0bbf\u0baf\u0bbe|\u0b87\u0bb2\u0b99\u0bcd\u0b95\u0bc8|\u0b9a\u0bbf\u0b99\u0bcd\u0b95\u0baa\u0bcd\u0baa\u0bc2\u0bb0\u0bcd|\u0c2d\u0c3e\u0c30\u0c24\u0c4d|\u0dbd\u0d82\u0d9a\u0dcf|\u0e04\u0e2d\u0e21|\u0e44\u0e17\u0e22|\u10d2\u10d4|\u307f\u3093\u306a|\u30b0\u30fc\u30b0\u30eb|\u30b3\u30e0|\u4e16\u754c|\u4e2d\u4fe1|\u4e2d\u56fd|\u4e2d\u570b|\u4e2d\u6587\u7f51|\u4f01\u4e1a|\u4f5b\u5c71|\u4fe1\u606f|\u5065\u5eb7|\u516b\u5366|\u516c\u53f8|\u516c\u76ca|\u53f0\u6e7e|\u53f0\u7063|\u5546\u57ce|\u5546\u5e97|\u5546\u6807|\u5728\u7ebf|\u5927\u62ff|\u5a31\u4e50|\u5de5\u884c|\u5e7f\u4e1c|\u6148\u5584|\u6211\u7231\u4f60|\u624b\u673a|\u653f\u52a1|\u653f\u5e9c|\u65b0\u52a0\u5761|\u65b0\u95fb|\u65f6\u5c1a|\u673a\u6784|\u6de1\u9a6c\u9521|\u6e38\u620f|\u70b9\u770b|\u79fb\u52a8|\u7ec4\u7ec7\u673a\u6784|\u7f51\u5740|\u7f51\u5e97|\u7f51\u7edc|\u8c37\u6b4c|\u96c6\u56e2|\u98de\u5229\u6d66|\u9910\u5385|\u9999\u6e2f|\ub2f7\ub137|\ub2f7\ucef4|\uc0bc\uc131|\ud55c\uad6d|xbox|xerox|xin|xn\\-\\-11b4c3d|xn\\-\\-1qqw23a|xn\\-\\-30rr7y|xn\\-\\-3bst00m|xn\\-\\-3ds443g|xn\\-\\-3e0b707e|xn\\-\\-3pxu8k|xn\\-\\-42c2d9a|xn\\-\\-45brj9c|xn\\-\\-45q11c|xn\\-\\-4gbrim|xn\\-\\-55qw42g|xn\\-\\-55qx5d|xn\\-\\-6frz82g|xn\\-\\-6qq986b3xl|xn\\-\\-80adxhks|xn\\-\\-80ao21a|xn\\-\\-80asehdb|xn\\-\\-80aswg|xn\\-\\-90a3ac|xn\\-\\-90ais|xn\\-\\-9dbq2a|xn\\-\\-9et52u|xn\\-\\-b4w605ferd|xn\\-\\-c1avg|xn\\-\\-c2br7g|xn\\-\\-cg4bki|xn\\-\\-clchc0ea0b2g2a9gcd|xn\\-\\-czr694b|xn\\-\\-czrs0t|xn\\-\\-czru2d|xn\\-\\-d1acj3b|xn\\-\\-d1alf|xn\\-\\-efvy88h|xn\\-\\-estv75g|xn\\-\\-fhbei|xn\\-\\-fiq228c5hs|xn\\-\\-fiq64b|xn\\-\\-fiqs8s|xn\\-\\-fiqz9s|xn\\-\\-fjq720a|xn\\-\\-flw351e|xn\\-\\-fpcrj9c3d|xn\\-\\-fzc2c9e2c|xn\\-\\-gecrj9c|xn\\-\\-h2brj9c|xn\\-\\-hxt814e|xn\\-\\-i1b6b1a6a2e|xn\\-\\-imr513n|xn\\-\\-io0a7i|xn\\-\\-j1aef|xn\\-\\-j1amh|xn\\-\\-j6w193g|xn\\-\\-kcrx77d1x4a|xn\\-\\-kprw13d|xn\\-\\-kpry57d|xn\\-\\-kput3i|xn\\-\\-l1acc|xn\\-\\-lgbbat1ad8j|xn\\-\\-mgb9awbf|xn\\-\\-mgba3a3ejt|xn\\-\\-mgba3a4f16a|xn\\-\\-mgbaam7a8h|xn\\-\\-mgbab2bd|xn\\-\\-mgbayh7gpa|xn\\-\\-mgbbh1a71e|xn\\-\\-mgbc0a9azcg|xn\\-\\-mgberp4a5d4ar|xn\\-\\-mgbpl2fh|xn\\-\\-mgbtx2b|xn\\-\\-mgbx4cd0ab|xn\\-\\-mk1bu44c|xn\\-\\-mxtq1m|xn\\-\\-ngbc5azd|xn\\-\\-node|xn\\-\\-nqv7f|xn\\-\\-nqv7fs00ema|xn\\-\\-nyqy26a|xn\\-\\-o3cw4h|xn\\-\\-ogbpf8fl|xn\\-\\-p1acf|xn\\-\\-p1ai|xn\\-\\-pgbs0dh|xn\\-\\-pssy2u|xn\\-\\-q9jyb4c|xn\\-\\-qcka1pmc|xn\\-\\-qxam|xn\\-\\-rhqv96g|xn\\-\\-s9brj9c|xn\\-\\-ses554g|xn\\-\\-t60b56a|xn\\-\\-tckwe|xn\\-\\-unup4y|xn\\-\\-vermgensberater\\-ctb|xn\\-\\-vermgensberatung\\-pwb|xn\\-\\-vhquv|xn\\-\\-vuq861b|xn\\-\\-wgbh1c|xn\\-\\-wgbl6a|xn\\-\\-xhq521b|xn\\-\\-xkc2al3hye2a|xn\\-\\-xkc2dl3a5ee0h|xn\\-\\-y9a3aq|xn\\-\\-yfro4i67o|xn\\-\\-ygbi2ammx|xn\\-\\-zfr164b|xperia|xxx|xyz)|(?:yachts|yamaxun|yandex|yodobashi|yoga|yokohama|youtube|y[et])|(?:zara|zip|zone|zuerich|z[amw]))"

.field public static final IP_ADDRESS:Ljava/util/regex/Pattern;

.field private static final IRI_LABEL:Ljava/lang/String; = "[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]](?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]_\\-]{0,61}[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]){0,1}"

.field private static final LABEL_CHAR:Ljava/lang/String; = "a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]"

.field private static final PATH_AND_QUERY:Ljava/lang/String; = "[/\\?](?:(?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]];/\\?:@&=#~\\-\\.\\+!\\*\'\\(\\),_\\$])|(?:%[a-fA-F0-9]{2}))*"

.field private static final PORT_NUMBER:Ljava/lang/String; = "\\:\\d{1,5}"

.field private static final PROTOCOL:Ljava/lang/String; = "(?i:http|https|rtsp)://"

.field private static final PUNYCODE_TLD:Ljava/lang/String; = "xn\\-\\-[\\w\\-]{0,58}\\w"

.field private static final RELAXED_DOMAIN_NAME:Ljava/lang/String;

.field private static final STRICT_DOMAIN_NAME:Ljava/util/regex/Pattern;

.field private static final STRICT_HOST_NAME:Ljava/lang/String; = "(?:(?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]](?:[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]_\\-]{0,61}[a-zA-Z0-9[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]){0,1}\\.)+(?:(?:(?:aaa|aarp|abb|abbott|abogado|academy|accenture|accountant|accountants|aco|active|actor|ads|adult|aeg|aero|afl|agency|aig|airforce|airtel|allfinanz|alsace|amica|amsterdam|android|apartments|app|apple|aquarelle|aramco|archi|army|arpa|arte|asia|associates|attorney|auction|audio|auto|autos|axa|azure|a[cdefgilmoqrstuwxz])|(?:band|bank|bar|barcelona|barclaycard|barclays|bargains|bauhaus|bayern|bbc|bbva|bcn|beats|beer|bentley|berlin|best|bet|bharti|bible|bid|bike|bing|bingo|bio|biz|black|blackfriday|bloomberg|blue|bms|bmw|bnl|bnpparibas|boats|bom|bond|boo|boots|boutique|bradesco|bridgestone|broadway|broker|brother|brussels|budapest|build|builders|business|buzz|bzh|b[abdefghijmnorstvwyz])|(?:cab|cafe|cal|camera|camp|cancerresearch|canon|capetown|capital|car|caravan|cards|care|career|careers|cars|cartier|casa|cash|casino|cat|catering|cba|cbn|ceb|center|ceo|cern|cfa|cfd|chanel|channel|chat|cheap|chloe|christmas|chrome|church|cipriani|cisco|citic|city|cityeats|claims|cleaning|click|clinic|clothing|cloud|club|clubmed|coach|codes|coffee|college|cologne|com|commbank|community|company|computer|comsec|condos|construction|consulting|contractors|cooking|cool|coop|corsica|country|coupons|courses|credit|creditcard|creditunion|cricket|crown|crs|cruises|csc|cuisinella|cymru|cyou|c[acdfghiklmnoruvwxyz])|(?:dabur|dad|dance|date|dating|datsun|day|dclk|deals|degree|delivery|dell|delta|democrat|dental|dentist|desi|design|dev|diamonds|diet|digital|direct|directory|discount|dnp|docs|dog|doha|domains|doosan|download|drive|durban|dvag|d[ejkmoz])|(?:earth|eat|edu|education|email|emerck|energy|engineer|engineering|enterprises|epson|equipment|erni|esq|estate|eurovision|eus|events|everbank|exchange|expert|exposed|express|e[cegrstu])|(?:fage|fail|fairwinds|faith|family|fan|fans|farm|fashion|feedback|ferrero|film|final|finance|financial|firmdale|fish|fishing|fit|fitness|flights|florist|flowers|flsmidth|fly|foo|football|forex|forsale|forum|foundation|frl|frogans|fund|furniture|futbol|fyi|f[ijkmor])|(?:gal|gallery|game|garden|gbiz|gdn|gea|gent|genting|ggee|gift|gifts|gives|giving|glass|gle|global|globo|gmail|gmo|gmx|gold|goldpoint|golf|goo|goog|google|gop|gov|grainger|graphics|gratis|green|gripe|group|gucci|guge|guide|guitars|guru|g[abdefghilmnpqrstuwy])|(?:hamburg|hangout|haus|healthcare|help|here|hermes|hiphop|hitachi|hiv|hockey|holdings|holiday|homedepot|homes|honda|horse|host|hosting|hoteles|hotmail|house|how|hsbc|hyundai|h[kmnrtu])|(?:ibm|icbc|ice|icu|ifm|iinet|immo|immobilien|industries|infiniti|info|ing|ink|institute|insure|int|international|investments|ipiranga|irish|ist|istanbul|itau|iwc|i[delmnoqrst])|(?:jaguar|java|jcb|jetzt|jewelry|jlc|jll|jobs|joburg|jprs|juegos|j[emop])|(?:kaufen|kddi|kia|kim|kinder|kitchen|kiwi|koeln|komatsu|krd|kred|kyoto|k[eghimnprwyz])|(?:lacaixa|lancaster|land|landrover|lasalle|lat|latrobe|law|lawyer|lds|lease|leclerc|legal|lexus|lgbt|liaison|lidl|life|lifestyle|lighting|limited|limo|linde|link|live|lixil|loan|loans|lol|london|lotte|lotto|love|ltd|ltda|lupin|luxe|luxury|l[abcikrstuvy])|(?:madrid|maif|maison|man|management|mango|market|marketing|markets|marriott|mba|media|meet|melbourne|meme|memorial|men|menu|meo|miami|microsoft|mil|mini|mma|mobi|moda|moe|moi|mom|monash|money|montblanc|mormon|mortgage|moscow|motorcycles|mov|movie|movistar|mtn|mtpc|mtr|museum|mutuelle|m[acdeghklmnopqrstuvwxyz])|(?:nadex|nagoya|name|navy|nec|net|netbank|network|neustar|new|news|nexus|ngo|nhk|nico|ninja|nissan|nokia|nra|nrw|ntt|nyc|n[acefgilopruz])|(?:obi|office|okinawa|omega|one|ong|onl|online|ooo|oracle|orange|org|organic|osaka|otsuka|ovh|om)|(?:page|panerai|paris|partners|parts|party|pet|pharmacy|philips|photo|photography|photos|physio|piaget|pics|pictet|pictures|ping|pink|pizza|place|play|playstation|plumbing|plus|pohl|poker|porn|post|praxi|press|pro|prod|productions|prof|properties|property|protection|pub|p[aefghklmnrstwy])|(?:qpon|quebec|qa)|(?:racing|realtor|realty|recipes|red|redstone|rehab|reise|reisen|reit|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rich|ricoh|rio|rip|rocher|rocks|rodeo|rsvp|ruhr|run|rwe|ryukyu|r[eosuw])|(?:saarland|sakura|sale|samsung|sandvik|sandvikcoromant|sanofi|sap|sapo|sarl|saxo|sbs|sca|scb|schmidt|scholarships|school|schule|schwarz|science|scor|scot|seat|security|seek|sener|services|seven|sew|sex|sexy|shiksha|shoes|show|shriram|singles|site|ski|sky|skype|sncf|soccer|social|software|sohu|solar|solutions|sony|soy|space|spiegel|spreadbetting|srl|stada|starhub|statoil|stc|stcgroup|stockholm|studio|study|style|sucks|supplies|supply|support|surf|surgery|suzuki|swatch|swiss|sydney|systems|s[abcdeghijklmnortuvxyz])|(?:tab|taipei|tatamotors|tatar|tattoo|tax|taxi|team|tech|technology|tel|telefonica|temasek|tennis|thd|theater|theatre|tickets|tienda|tips|tires|tirol|today|tokyo|tools|top|toray|toshiba|tours|town|toyota|toys|trade|trading|training|travel|trust|tui|t[cdfghjklmnortvwz])|(?:ubs|university|uno|uol|u[agksyz])|(?:vacations|vana|vegas|ventures|versicherung|vet|viajes|video|villas|vin|virgin|vision|vista|vistaprint|viva|vlaanderen|vodka|vote|voting|voto|voyage|v[aceginu])|(?:wales|walter|wang|watch|webcam|website|wed|wedding|weir|whoswho|wien|wiki|williamhill|win|windows|wine|wme|work|works|world|wtc|wtf|w[fs])|(?:\u03b5\u03bb|\u0431\u0435\u043b|\u0434\u0435\u0442\u0438|\u043a\u043e\u043c|\u043c\u043a\u0434|\u043c\u043e\u043d|\u043c\u043e\u0441\u043a\u0432\u0430|\u043e\u043d\u043b\u0430\u0439\u043d|\u043e\u0440\u0433|\u0440\u0443\u0441|\u0440\u0444|\u0441\u0430\u0439\u0442|\u0441\u0440\u0431|\u0443\u043a\u0440|\u049b\u0430\u0437|\u0570\u0561\u0575|\u05e7\u05d5\u05dd|\u0627\u0631\u0627\u0645\u0643\u0648|\u0627\u0644\u0627\u0631\u062f\u0646|\u0627\u0644\u062c\u0632\u0627\u0626\u0631|\u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629|\u0627\u0644\u0645\u063a\u0631\u0628|\u0627\u0645\u0627\u0631\u0627\u062a|\u0627\u06cc\u0631\u0627\u0646|\u0628\u0627\u0632\u0627\u0631|\u0628\u06be\u0627\u0631\u062a|\u062a\u0648\u0646\u0633|\u0633\u0648\u062f\u0627\u0646|\u0633\u0648\u0631\u064a\u0629|\u0634\u0628\u0643\u0629|\u0639\u0631\u0627\u0642|\u0639\u0645\u0627\u0646|\u0641\u0644\u0633\u0637\u064a\u0646|\u0642\u0637\u0631|\u0643\u0648\u0645|\u0645\u0635\u0631|\u0645\u0644\u064a\u0633\u064a\u0627|\u0645\u0648\u0642\u0639|\u0915\u0949\u092e|\u0928\u0947\u091f|\u092d\u093e\u0930\u0924|\u0938\u0902\u0917\u0920\u0928|\u09ad\u09be\u09b0\u09a4|\u0a2d\u0a3e\u0a30\u0a24|\u0aad\u0abe\u0ab0\u0aa4|\u0b87\u0ba8\u0bcd\u0ba4\u0bbf\u0baf\u0bbe|\u0b87\u0bb2\u0b99\u0bcd\u0b95\u0bc8|\u0b9a\u0bbf\u0b99\u0bcd\u0b95\u0baa\u0bcd\u0baa\u0bc2\u0bb0\u0bcd|\u0c2d\u0c3e\u0c30\u0c24\u0c4d|\u0dbd\u0d82\u0d9a\u0dcf|\u0e04\u0e2d\u0e21|\u0e44\u0e17\u0e22|\u10d2\u10d4|\u307f\u3093\u306a|\u30b0\u30fc\u30b0\u30eb|\u30b3\u30e0|\u4e16\u754c|\u4e2d\u4fe1|\u4e2d\u56fd|\u4e2d\u570b|\u4e2d\u6587\u7f51|\u4f01\u4e1a|\u4f5b\u5c71|\u4fe1\u606f|\u5065\u5eb7|\u516b\u5366|\u516c\u53f8|\u516c\u76ca|\u53f0\u6e7e|\u53f0\u7063|\u5546\u57ce|\u5546\u5e97|\u5546\u6807|\u5728\u7ebf|\u5927\u62ff|\u5a31\u4e50|\u5de5\u884c|\u5e7f\u4e1c|\u6148\u5584|\u6211\u7231\u4f60|\u624b\u673a|\u653f\u52a1|\u653f\u5e9c|\u65b0\u52a0\u5761|\u65b0\u95fb|\u65f6\u5c1a|\u673a\u6784|\u6de1\u9a6c\u9521|\u6e38\u620f|\u70b9\u770b|\u79fb\u52a8|\u7ec4\u7ec7\u673a\u6784|\u7f51\u5740|\u7f51\u5e97|\u7f51\u7edc|\u8c37\u6b4c|\u96c6\u56e2|\u98de\u5229\u6d66|\u9910\u5385|\u9999\u6e2f|\ub2f7\ub137|\ub2f7\ucef4|\uc0bc\uc131|\ud55c\uad6d|xbox|xerox|xin|xn\\-\\-11b4c3d|xn\\-\\-1qqw23a|xn\\-\\-30rr7y|xn\\-\\-3bst00m|xn\\-\\-3ds443g|xn\\-\\-3e0b707e|xn\\-\\-3pxu8k|xn\\-\\-42c2d9a|xn\\-\\-45brj9c|xn\\-\\-45q11c|xn\\-\\-4gbrim|xn\\-\\-55qw42g|xn\\-\\-55qx5d|xn\\-\\-6frz82g|xn\\-\\-6qq986b3xl|xn\\-\\-80adxhks|xn\\-\\-80ao21a|xn\\-\\-80asehdb|xn\\-\\-80aswg|xn\\-\\-90a3ac|xn\\-\\-90ais|xn\\-\\-9dbq2a|xn\\-\\-9et52u|xn\\-\\-b4w605ferd|xn\\-\\-c1avg|xn\\-\\-c2br7g|xn\\-\\-cg4bki|xn\\-\\-clchc0ea0b2g2a9gcd|xn\\-\\-czr694b|xn\\-\\-czrs0t|xn\\-\\-czru2d|xn\\-\\-d1acj3b|xn\\-\\-d1alf|xn\\-\\-efvy88h|xn\\-\\-estv75g|xn\\-\\-fhbei|xn\\-\\-fiq228c5hs|xn\\-\\-fiq64b|xn\\-\\-fiqs8s|xn\\-\\-fiqz9s|xn\\-\\-fjq720a|xn\\-\\-flw351e|xn\\-\\-fpcrj9c3d|xn\\-\\-fzc2c9e2c|xn\\-\\-gecrj9c|xn\\-\\-h2brj9c|xn\\-\\-hxt814e|xn\\-\\-i1b6b1a6a2e|xn\\-\\-imr513n|xn\\-\\-io0a7i|xn\\-\\-j1aef|xn\\-\\-j1amh|xn\\-\\-j6w193g|xn\\-\\-kcrx77d1x4a|xn\\-\\-kprw13d|xn\\-\\-kpry57d|xn\\-\\-kput3i|xn\\-\\-l1acc|xn\\-\\-lgbbat1ad8j|xn\\-\\-mgb9awbf|xn\\-\\-mgba3a3ejt|xn\\-\\-mgba3a4f16a|xn\\-\\-mgbaam7a8h|xn\\-\\-mgbab2bd|xn\\-\\-mgbayh7gpa|xn\\-\\-mgbbh1a71e|xn\\-\\-mgbc0a9azcg|xn\\-\\-mgberp4a5d4ar|xn\\-\\-mgbpl2fh|xn\\-\\-mgbtx2b|xn\\-\\-mgbx4cd0ab|xn\\-\\-mk1bu44c|xn\\-\\-mxtq1m|xn\\-\\-ngbc5azd|xn\\-\\-node|xn\\-\\-nqv7f|xn\\-\\-nqv7fs00ema|xn\\-\\-nyqy26a|xn\\-\\-o3cw4h|xn\\-\\-ogbpf8fl|xn\\-\\-p1acf|xn\\-\\-p1ai|xn\\-\\-pgbs0dh|xn\\-\\-pssy2u|xn\\-\\-q9jyb4c|xn\\-\\-qcka1pmc|xn\\-\\-qxam|xn\\-\\-rhqv96g|xn\\-\\-s9brj9c|xn\\-\\-ses554g|xn\\-\\-t60b56a|xn\\-\\-tckwe|xn\\-\\-unup4y|xn\\-\\-vermgensberater\\-ctb|xn\\-\\-vermgensberatung\\-pwb|xn\\-\\-vhquv|xn\\-\\-vuq861b|xn\\-\\-wgbh1c|xn\\-\\-wgbl6a|xn\\-\\-xhq521b|xn\\-\\-xkc2al3hye2a|xn\\-\\-xkc2dl3a5ee0h|xn\\-\\-y9a3aq|xn\\-\\-yfro4i67o|xn\\-\\-ygbi2ammx|xn\\-\\-zfr164b|xperia|xxx|xyz)|(?:yachts|yamaxun|yandex|yodobashi|yoga|yokohama|youtube|y[et])|(?:zara|zip|zone|zuerich|z[amw]))|xn\\-\\-[\\w\\-]{0,58}\\w))"

.field private static final STRICT_TLD:Ljava/lang/String; = "(?:(?:(?:aaa|aarp|abb|abbott|abogado|academy|accenture|accountant|accountants|aco|active|actor|ads|adult|aeg|aero|afl|agency|aig|airforce|airtel|allfinanz|alsace|amica|amsterdam|android|apartments|app|apple|aquarelle|aramco|archi|army|arpa|arte|asia|associates|attorney|auction|audio|auto|autos|axa|azure|a[cdefgilmoqrstuwxz])|(?:band|bank|bar|barcelona|barclaycard|barclays|bargains|bauhaus|bayern|bbc|bbva|bcn|beats|beer|bentley|berlin|best|bet|bharti|bible|bid|bike|bing|bingo|bio|biz|black|blackfriday|bloomberg|blue|bms|bmw|bnl|bnpparibas|boats|bom|bond|boo|boots|boutique|bradesco|bridgestone|broadway|broker|brother|brussels|budapest|build|builders|business|buzz|bzh|b[abdefghijmnorstvwyz])|(?:cab|cafe|cal|camera|camp|cancerresearch|canon|capetown|capital|car|caravan|cards|care|career|careers|cars|cartier|casa|cash|casino|cat|catering|cba|cbn|ceb|center|ceo|cern|cfa|cfd|chanel|channel|chat|cheap|chloe|christmas|chrome|church|cipriani|cisco|citic|city|cityeats|claims|cleaning|click|clinic|clothing|cloud|club|clubmed|coach|codes|coffee|college|cologne|com|commbank|community|company|computer|comsec|condos|construction|consulting|contractors|cooking|cool|coop|corsica|country|coupons|courses|credit|creditcard|creditunion|cricket|crown|crs|cruises|csc|cuisinella|cymru|cyou|c[acdfghiklmnoruvwxyz])|(?:dabur|dad|dance|date|dating|datsun|day|dclk|deals|degree|delivery|dell|delta|democrat|dental|dentist|desi|design|dev|diamonds|diet|digital|direct|directory|discount|dnp|docs|dog|doha|domains|doosan|download|drive|durban|dvag|d[ejkmoz])|(?:earth|eat|edu|education|email|emerck|energy|engineer|engineering|enterprises|epson|equipment|erni|esq|estate|eurovision|eus|events|everbank|exchange|expert|exposed|express|e[cegrstu])|(?:fage|fail|fairwinds|faith|family|fan|fans|farm|fashion|feedback|ferrero|film|final|finance|financial|firmdale|fish|fishing|fit|fitness|flights|florist|flowers|flsmidth|fly|foo|football|forex|forsale|forum|foundation|frl|frogans|fund|furniture|futbol|fyi|f[ijkmor])|(?:gal|gallery|game|garden|gbiz|gdn|gea|gent|genting|ggee|gift|gifts|gives|giving|glass|gle|global|globo|gmail|gmo|gmx|gold|goldpoint|golf|goo|goog|google|gop|gov|grainger|graphics|gratis|green|gripe|group|gucci|guge|guide|guitars|guru|g[abdefghilmnpqrstuwy])|(?:hamburg|hangout|haus|healthcare|help|here|hermes|hiphop|hitachi|hiv|hockey|holdings|holiday|homedepot|homes|honda|horse|host|hosting|hoteles|hotmail|house|how|hsbc|hyundai|h[kmnrtu])|(?:ibm|icbc|ice|icu|ifm|iinet|immo|immobilien|industries|infiniti|info|ing|ink|institute|insure|int|international|investments|ipiranga|irish|ist|istanbul|itau|iwc|i[delmnoqrst])|(?:jaguar|java|jcb|jetzt|jewelry|jlc|jll|jobs|joburg|jprs|juegos|j[emop])|(?:kaufen|kddi|kia|kim|kinder|kitchen|kiwi|koeln|komatsu|krd|kred|kyoto|k[eghimnprwyz])|(?:lacaixa|lancaster|land|landrover|lasalle|lat|latrobe|law|lawyer|lds|lease|leclerc|legal|lexus|lgbt|liaison|lidl|life|lifestyle|lighting|limited|limo|linde|link|live|lixil|loan|loans|lol|london|lotte|lotto|love|ltd|ltda|lupin|luxe|luxury|l[abcikrstuvy])|(?:madrid|maif|maison|man|management|mango|market|marketing|markets|marriott|mba|media|meet|melbourne|meme|memorial|men|menu|meo|miami|microsoft|mil|mini|mma|mobi|moda|moe|moi|mom|monash|money|montblanc|mormon|mortgage|moscow|motorcycles|mov|movie|movistar|mtn|mtpc|mtr|museum|mutuelle|m[acdeghklmnopqrstuvwxyz])|(?:nadex|nagoya|name|navy|nec|net|netbank|network|neustar|new|news|nexus|ngo|nhk|nico|ninja|nissan|nokia|nra|nrw|ntt|nyc|n[acefgilopruz])|(?:obi|office|okinawa|omega|one|ong|onl|online|ooo|oracle|orange|org|organic|osaka|otsuka|ovh|om)|(?:page|panerai|paris|partners|parts|party|pet|pharmacy|philips|photo|photography|photos|physio|piaget|pics|pictet|pictures|ping|pink|pizza|place|play|playstation|plumbing|plus|pohl|poker|porn|post|praxi|press|pro|prod|productions|prof|properties|property|protection|pub|p[aefghklmnrstwy])|(?:qpon|quebec|qa)|(?:racing|realtor|realty|recipes|red|redstone|rehab|reise|reisen|reit|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rich|ricoh|rio|rip|rocher|rocks|rodeo|rsvp|ruhr|run|rwe|ryukyu|r[eosuw])|(?:saarland|sakura|sale|samsung|sandvik|sandvikcoromant|sanofi|sap|sapo|sarl|saxo|sbs|sca|scb|schmidt|scholarships|school|schule|schwarz|science|scor|scot|seat|security|seek|sener|services|seven|sew|sex|sexy|shiksha|shoes|show|shriram|singles|site|ski|sky|skype|sncf|soccer|social|software|sohu|solar|solutions|sony|soy|space|spiegel|spreadbetting|srl|stada|starhub|statoil|stc|stcgroup|stockholm|studio|study|style|sucks|supplies|supply|support|surf|surgery|suzuki|swatch|swiss|sydney|systems|s[abcdeghijklmnortuvxyz])|(?:tab|taipei|tatamotors|tatar|tattoo|tax|taxi|team|tech|technology|tel|telefonica|temasek|tennis|thd|theater|theatre|tickets|tienda|tips|tires|tirol|today|tokyo|tools|top|toray|toshiba|tours|town|toyota|toys|trade|trading|training|travel|trust|tui|t[cdfghjklmnortvwz])|(?:ubs|university|uno|uol|u[agksyz])|(?:vacations|vana|vegas|ventures|versicherung|vet|viajes|video|villas|vin|virgin|vision|vista|vistaprint|viva|vlaanderen|vodka|vote|voting|voto|voyage|v[aceginu])|(?:wales|walter|wang|watch|webcam|website|wed|wedding|weir|whoswho|wien|wiki|williamhill|win|windows|wine|wme|work|works|world|wtc|wtf|w[fs])|(?:\u03b5\u03bb|\u0431\u0435\u043b|\u0434\u0435\u0442\u0438|\u043a\u043e\u043c|\u043c\u043a\u0434|\u043c\u043e\u043d|\u043c\u043e\u0441\u043a\u0432\u0430|\u043e\u043d\u043b\u0430\u0439\u043d|\u043e\u0440\u0433|\u0440\u0443\u0441|\u0440\u0444|\u0441\u0430\u0439\u0442|\u0441\u0440\u0431|\u0443\u043a\u0440|\u049b\u0430\u0437|\u0570\u0561\u0575|\u05e7\u05d5\u05dd|\u0627\u0631\u0627\u0645\u0643\u0648|\u0627\u0644\u0627\u0631\u062f\u0646|\u0627\u0644\u062c\u0632\u0627\u0626\u0631|\u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629|\u0627\u0644\u0645\u063a\u0631\u0628|\u0627\u0645\u0627\u0631\u0627\u062a|\u0627\u06cc\u0631\u0627\u0646|\u0628\u0627\u0632\u0627\u0631|\u0628\u06be\u0627\u0631\u062a|\u062a\u0648\u0646\u0633|\u0633\u0648\u062f\u0627\u0646|\u0633\u0648\u0631\u064a\u0629|\u0634\u0628\u0643\u0629|\u0639\u0631\u0627\u0642|\u0639\u0645\u0627\u0646|\u0641\u0644\u0633\u0637\u064a\u0646|\u0642\u0637\u0631|\u0643\u0648\u0645|\u0645\u0635\u0631|\u0645\u0644\u064a\u0633\u064a\u0627|\u0645\u0648\u0642\u0639|\u0915\u0949\u092e|\u0928\u0947\u091f|\u092d\u093e\u0930\u0924|\u0938\u0902\u0917\u0920\u0928|\u09ad\u09be\u09b0\u09a4|\u0a2d\u0a3e\u0a30\u0a24|\u0aad\u0abe\u0ab0\u0aa4|\u0b87\u0ba8\u0bcd\u0ba4\u0bbf\u0baf\u0bbe|\u0b87\u0bb2\u0b99\u0bcd\u0b95\u0bc8|\u0b9a\u0bbf\u0b99\u0bcd\u0b95\u0baa\u0bcd\u0baa\u0bc2\u0bb0\u0bcd|\u0c2d\u0c3e\u0c30\u0c24\u0c4d|\u0dbd\u0d82\u0d9a\u0dcf|\u0e04\u0e2d\u0e21|\u0e44\u0e17\u0e22|\u10d2\u10d4|\u307f\u3093\u306a|\u30b0\u30fc\u30b0\u30eb|\u30b3\u30e0|\u4e16\u754c|\u4e2d\u4fe1|\u4e2d\u56fd|\u4e2d\u570b|\u4e2d\u6587\u7f51|\u4f01\u4e1a|\u4f5b\u5c71|\u4fe1\u606f|\u5065\u5eb7|\u516b\u5366|\u516c\u53f8|\u516c\u76ca|\u53f0\u6e7e|\u53f0\u7063|\u5546\u57ce|\u5546\u5e97|\u5546\u6807|\u5728\u7ebf|\u5927\u62ff|\u5a31\u4e50|\u5de5\u884c|\u5e7f\u4e1c|\u6148\u5584|\u6211\u7231\u4f60|\u624b\u673a|\u653f\u52a1|\u653f\u5e9c|\u65b0\u52a0\u5761|\u65b0\u95fb|\u65f6\u5c1a|\u673a\u6784|\u6de1\u9a6c\u9521|\u6e38\u620f|\u70b9\u770b|\u79fb\u52a8|\u7ec4\u7ec7\u673a\u6784|\u7f51\u5740|\u7f51\u5e97|\u7f51\u7edc|\u8c37\u6b4c|\u96c6\u56e2|\u98de\u5229\u6d66|\u9910\u5385|\u9999\u6e2f|\ub2f7\ub137|\ub2f7\ucef4|\uc0bc\uc131|\ud55c\uad6d|xbox|xerox|xin|xn\\-\\-11b4c3d|xn\\-\\-1qqw23a|xn\\-\\-30rr7y|xn\\-\\-3bst00m|xn\\-\\-3ds443g|xn\\-\\-3e0b707e|xn\\-\\-3pxu8k|xn\\-\\-42c2d9a|xn\\-\\-45brj9c|xn\\-\\-45q11c|xn\\-\\-4gbrim|xn\\-\\-55qw42g|xn\\-\\-55qx5d|xn\\-\\-6frz82g|xn\\-\\-6qq986b3xl|xn\\-\\-80adxhks|xn\\-\\-80ao21a|xn\\-\\-80asehdb|xn\\-\\-80aswg|xn\\-\\-90a3ac|xn\\-\\-90ais|xn\\-\\-9dbq2a|xn\\-\\-9et52u|xn\\-\\-b4w605ferd|xn\\-\\-c1avg|xn\\-\\-c2br7g|xn\\-\\-cg4bki|xn\\-\\-clchc0ea0b2g2a9gcd|xn\\-\\-czr694b|xn\\-\\-czrs0t|xn\\-\\-czru2d|xn\\-\\-d1acj3b|xn\\-\\-d1alf|xn\\-\\-efvy88h|xn\\-\\-estv75g|xn\\-\\-fhbei|xn\\-\\-fiq228c5hs|xn\\-\\-fiq64b|xn\\-\\-fiqs8s|xn\\-\\-fiqz9s|xn\\-\\-fjq720a|xn\\-\\-flw351e|xn\\-\\-fpcrj9c3d|xn\\-\\-fzc2c9e2c|xn\\-\\-gecrj9c|xn\\-\\-h2brj9c|xn\\-\\-hxt814e|xn\\-\\-i1b6b1a6a2e|xn\\-\\-imr513n|xn\\-\\-io0a7i|xn\\-\\-j1aef|xn\\-\\-j1amh|xn\\-\\-j6w193g|xn\\-\\-kcrx77d1x4a|xn\\-\\-kprw13d|xn\\-\\-kpry57d|xn\\-\\-kput3i|xn\\-\\-l1acc|xn\\-\\-lgbbat1ad8j|xn\\-\\-mgb9awbf|xn\\-\\-mgba3a3ejt|xn\\-\\-mgba3a4f16a|xn\\-\\-mgbaam7a8h|xn\\-\\-mgbab2bd|xn\\-\\-mgbayh7gpa|xn\\-\\-mgbbh1a71e|xn\\-\\-mgbc0a9azcg|xn\\-\\-mgberp4a5d4ar|xn\\-\\-mgbpl2fh|xn\\-\\-mgbtx2b|xn\\-\\-mgbx4cd0ab|xn\\-\\-mk1bu44c|xn\\-\\-mxtq1m|xn\\-\\-ngbc5azd|xn\\-\\-node|xn\\-\\-nqv7f|xn\\-\\-nqv7fs00ema|xn\\-\\-nyqy26a|xn\\-\\-o3cw4h|xn\\-\\-ogbpf8fl|xn\\-\\-p1acf|xn\\-\\-p1ai|xn\\-\\-pgbs0dh|xn\\-\\-pssy2u|xn\\-\\-q9jyb4c|xn\\-\\-qcka1pmc|xn\\-\\-qxam|xn\\-\\-rhqv96g|xn\\-\\-s9brj9c|xn\\-\\-ses554g|xn\\-\\-t60b56a|xn\\-\\-tckwe|xn\\-\\-unup4y|xn\\-\\-vermgensberater\\-ctb|xn\\-\\-vermgensberatung\\-pwb|xn\\-\\-vhquv|xn\\-\\-vuq861b|xn\\-\\-wgbh1c|xn\\-\\-wgbl6a|xn\\-\\-xhq521b|xn\\-\\-xkc2al3hye2a|xn\\-\\-xkc2dl3a5ee0h|xn\\-\\-y9a3aq|xn\\-\\-yfro4i67o|xn\\-\\-ygbi2ammx|xn\\-\\-zfr164b|xperia|xxx|xyz)|(?:yachts|yamaxun|yandex|yodobashi|yoga|yokohama|youtube|y[et])|(?:zara|zip|zone|zuerich|z[amw]))|xn\\-\\-[\\w\\-]{0,58}\\w)"

.field private static final TLD:Ljava/lang/String; = "(xn\\-\\-[\\w\\-]{0,58}\\w|[a-zA-Z[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]]{2,63})"

.field private static final TLD_CHAR:Ljava/lang/String; = "a-zA-Z[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]"

.field private static final UCS_CHAR:Ljava/lang/String; = "[\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef\ud800\udc00-\ud83f\udffd\ud840\udc00-\ud87f\udffd\ud880\udc00-\ud8bf\udffd\ud8c0\udc00-\ud8ff\udffd\ud900\udc00-\ud93f\udffd\ud940\udc00-\ud97f\udffd\ud980\udc00-\ud9bf\udffd\ud9c0\udc00-\ud9ff\udffd\uda00\udc00-\uda3f\udffd\uda40\udc00-\uda7f\udffd\uda80\udc00-\udabf\udffd\udac0\udc00-\udaff\udffd\udb00\udc00-\udb3f\udffd\udb44\udc00-\udb7f\udffd&&[^\u00a0[\u2000-\u200a]\u2028\u2029\u202f\u3000]]"

.field private static final USER_INFO:Ljava/lang/String; = "(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,64}(?:\\:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,25})?\\@"

.field public static final WEB_URL:Ljava/util/regex/Pattern;

.field private static final WEB_URL_WITHOUT_PROTOCOL:Ljava/lang/String;

.field private static final WEB_URL_WITH_PROTOCOL:Ljava/lang/String;

.field private static final WORD_BOUNDARY:Ljava/lang/String; = "(?:\\b|$|^)"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const-string v0, "46585F5435514A502F1242365143553A3E424349301D35514A542F35404058331A55180E35414058333A57484B330C365043583A4C2E40585F5435514A502F1242365143553A3E424349301D35514A542F35404058331A55180E35414058333A57484B330C365043583A1942472C43495C543C555F5B2D115335514A512F35404058331D3C555F5F2D365143583A1E40130C365043583A3E424349301D35504A5C2F1240443D40495550295E5D583C12533C555F5A2D365143583A19295E5D5C3C35514A5C2F1542101D35504A5C2F35404058331D3C555F572D4448"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->IP_ADDRESS:Ljava/util/regex/Pattern;

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "46583600431B2648285E5D543AACC14A88EDD19FC9E1438ED0EA9DD9C0408ED1CE97F5F2EE5D9DFED1DC97C5F2EE5D9DCED1DC97D5F2EE5D9DDED1DC96E5F2EE5D9CEED1DC96F5F2EE5D9CFED1DC96C5F2EE5D9CCED1DC96D5F2EE5D9CDED1DC95E5F2EE5D9FEED1DC95F5F2EE5D9FFED1DC95C5F2EE5D9FCED1DC95D5F2EE5D9FDED1DC94E5F2EE5D9EEED1DC94F5F2EE5D9EFED1DC94C4F2EE5D9ECED1DC41432930B2CD3A8CE1E74890EEFA3083EEC985E5DB8CF0C282EEE13A382F464F573A0F4C1D245F3440405835A3C7489FF1CF82C5EE4C88D2FD81C7DD4C81DEC895E2EEF04091F1DEDA95D2EEF04091C1DEDA95C2EEF04091D1DEDA94F2EEF04090E1DEDA94E2EEF04090F1DEDA94D2EEF04090C1DEDA94C2EEF04090D1DEDA97F2EEF04093E1DEDA97E2EEF04093F1DEDA97D2EEF04093C1DEDA97C2EEF04093D1DEDA96F2EEF04092E1DEDA96E2EEF04092F1DEDA96D3EEF04092C1DEDA4354352EAFC13583E7E55F8CF0E73C8CE1CF87F2C792EDCE8DE1E7382F312C403C15514B5343132B0C4C14204A3F42434936A3CE4C8AFACD81D4ED4C81D6E88AC5DE5D82DEC191F7E5F24380F2DED391C7E5F24380C2DED391D7E5F24380D2DED390E7E5F24381E2DED390F7E5F24381F2DED390C7E5F24381C2DED390D7E5F24381D2DED393E7E5F24382E2DED393F7E5F24382F2DED393C7E5F24382C2DED393D7E5F24382D2DED392E7E5F24383E2DED392F7E5F24383F2DED392C6E5F24383C2DED347413E2CACD03683EEE14A87F2E42D8FE1C683E7CC90EEDF8EE1EE3C3A385B15404150133D494C594608033D433D4A3E2E192C403C15514B504A132C1A1D35004A1F33432A36A3CE4C8AFACD81D4ED4C81D6E88AC5DE5D82DEC191F7E5F24380F2DED391C7E5F24380C2DED391D7E5F24380D2DED390E7E5F24381E2DED390F7E5F24381F2DED390C7E5F24381C2DED390D7E5F24381D2DED393E7E5F24382E2DED393F7E5F24382F2DED393C7E5F24382C2DED393D7E5F24382D2DED392E7E5F24383E2DED392F7E5F24383F2DED392C6E5F24383C2DED347413E2CACD03683EEE14A87F2E42D8FE1C683E7CC90EEDF8EE1EE3C3A38095C5C5B5213481B"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroidx/core/util/PatternsCompat;->IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "47"

    invoke-static {v1}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 209
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->DOMAIN_NAME:Ljava/util/regex/Pattern;

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "4658455E5449580C480604191112091311021D0C1F151D114E5F5D4158525B465E5D3E13430A2C4C34514A5C2E4A2C403D313D4939593251314B32463B4D2E472C413D553D583954324D301D465E5D3957351140072F4C21555F572D165313484E1E434246591C465E5D3948464F573A0F4C1D245F3440405832453B482E312C433D453D4639583257314932483B492E552C523D483D5A380E464F573D4B3A0648142F5D2B5143583A1E401359441A5F4D55500F474F3121475E4E5A5A514A"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroidx/core/util/PatternsCompat;->DOMAIN_NAME:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "4758525B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "324A310515504B500F"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "474F4449"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "355F315E3349585F5A514A3600431B2648285E5D543AACC14A88EDD19FC9E1438ED0EA9DD9C0408ED1CE97F5F2EE5D9DFED1DC97C5F2EE5D9DCED1DC97D5F2EE5D9DDED1DC96E5F2EE5D9CEED1DC96F5F2EE5D9CFED1DC96C5F2EE5D9CCED1DC96D5F2EE5D9CDED1DC95E5F2EE5D9FEED1DC95F5F2EE5D9FFED1DC95C5F2EE5D9FCED1DC95D5F2EE5D9FDED1DC94E5F2EE5D9EEED1DC94F5F2EE5D9EFED1DC94C4F2EE5D9ECED1DC41432930B2CD3A8CE1E74890EEFA3083EEC985E5DB8CF0C282EEE13A3849412C525B2E475A460C325D314F324A463958492C453D474D38395633591149515B423E1343162C4C28514A5C2F15421048474B"

    invoke-static {v4}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "474F"

    invoke-static {v5}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "464F573D0C1D43192C47"

    invoke-static {v6}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->WEB_URL:Ljava/util/regex/Pattern;

    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "464F5749515B4F5A483511401B2F4C3D555F572BAFC1438CF8DA9DCAF0408ED9EE88D2C2439FD2CE9EF1E7E55F9EEFD2DC9EC1E7E55F9EDFD2DC9ED1E7E55F9ECFD2DC9FE1E7E55F9FFFD2DC9FF1E7E55F9FEFD2DC9FC1E7E55F9FDFD2DC9FD1E7E55F9FCFD2DC9CE1E7E55F9CFFD2DC9CF1E7E55F9CEFD2DC9CC1E7E55F9CDFD2DC9CD1E7E55F9CCFD2DC9DE1E7E55F9DFFD2DC9DF1E7E55F9DEFD2DC9DC0E7E55F9DDFD2DC48473C3BB0CE2B8FE1EE4C85E5F83392EDC98CE1CE87F2C193EDE1333C3A4D4D542B0C4C14204A3F42434936A3CE4C8AFACD81D4ED4C81D6E88AC5DE5D82DEC191F7E5F24380F2DED391C7E5F24380C2DED391D7E5F24380D2DED390E7E5F24381E2DED390F7E5F24381F2DED390C7E5F24381C2DED390D7E5F24381D2DED393E7E5F24382E2DED393F7E5F24382F2DED393C7E5F24382C2DED393D7E5F24382D2DED392E7E5F24383E2DED392F7E5F24383F2DED392C6E5F24383C2DED347413E2CACD03683EEE14A87F2E42D8FE1C683E7CC90EEDF8EE1EE3C3A3A2E432D165142575618290F5D1720433B57484B35B2CD4C83FED88AD6EE5D82D6E18ED0D55F81CFC291FEE1E74882F1CFD091CEE1E74882C1CFD091DEE1E74882D1CFD090EEE1E74883E1CFD090FEE1E74883F1CFD090CEE1E74883C1CFD090DEE1E74883D1CFD093EEE1E74880E1CFD093FEE1E74880F1CFD093CEE1E74880C1CFD093DEE1E74880D1CFD092EEE1E74881E1CFD092FEE1E74881F1CFD092CFE1E74881C1CFD047483A39A7D23592EDE14383E7EF2F8CF0C583EEC885E5DD8DF0ED3C333C4E1E424241103D40484C4D4D5458525B465E5D04130F0C0C001C111B04100C0C0C030C0E13110E0F1202060F050819130D11090403181B04110D1503151B130219130D1302140015060B0612110E02011409111300041E1D0F020819130D0404170B1D060606010211000A121B04161B1C191D0F040019130B02021D0F070B191309150302171D060C1512110413080E150617121104131A040B1913021C0B080000091F0E0F1C1E000D041B041F07130C1D0F0C1411171C140C0C12000901000119091D0F11061706031503151D1D06150212111D1102041B04031B111F04020D0219131C110002011D061711061911001C0C1E19131C000C1D0F1313000E0F030400120014161D0D190C150B121B04061A1F1F0F0B181B04070D04040E001D061016071F11001B150819131B04021212001F040E0F0A18130B1D063E110A150B06070D0A0A031C03191419191D385B1258525B0C0009010E0C11030A120306170E0C111F020B0D080B1312120C130D0D061C110F02091D0C0015061E0F091E1D0C00150213071E1E1D0C00120D131B0311030F1802171C12120F02120305131312120E0F12030204061D0C0F040B131B071700040104171D0500000219031D0C0414110E0C15191D0C09061706070C0F080C0D02191007141103070A021910071E0A1D0C0809021D1212040E12030E1F0E0C1C0C02051D0509130D1B0B130705061C0E0C1C020E0303021715121201140B1D05080112120016120309090E0C1E1D110F130E07131D0C0F0E0F15141910011D1103010F031910011F1103010E13160E0C1F1815071012000E0C020C050B12040A0E0C020405090414111D001511031C0E0601050F0911031C0E0C000012121F0E1A0902170E0C0218121D040B160E0C0509001E0414110E0C05040D0A1D05101B021408131D1D051001071E08121D1D051008140C0F1B061D053E130C14080709090E0F1F001F1F121A17101C0833591149515B04041012130C070B1D04041E12130C0C0B130619110F1D1D1D0D000906171C0208120B0015061A12130C0F010F1B06131E15190E190F1B06131E191900021D04040012130C130F17060B0E0D111F051D1D0404000B0C0E001C0402170E0D111F040B131419110F021E1D0D0015111B0B0211020F120619110F03051D0D00140C1C010C0E001A1D0404060B02040F091D04071312130F0F120202070E0D1503150B131B0617010C0E041C0F1B06140F0C0E070A1D040D130015011D0D09060B1C0B1C1102060013191106150C1112020F091D0B0C0E091C0814111F0F0311020613080817121305141C020F191107001F080F0F0E191107030E0E12020E111B0D0C0E081A181B061B1A0908001A121B061E0F19001212020B00130019030612020B0C11050C0E0D070F0E060E0D1C0215060809020E0D1C02140A1D0409070C0C0E0D1B030A0016121302000D091B061D0A151E1D0D0E0103170B0C0E0E020D0202171213020D010609000E0D1F001D0D0E0A08100F1E061D0D0E0A08070019191812020808020F1E141D0D0E0A15071A151F1D0D0E0A16170D0C0E0E000508160E0D1F03121A13120606071F031D0D0E0916070204040F091D040A1C1A020C021A0E15160E0D1F020A070F001911011F011D0D0E08150E0D1F1F120702061911010503151C181B061D1B00020F1D1D040A071C0308121202150016070411021C04030C060D111F0512021500160704180F070E0919111C190E0A0B151B06000107031D0D131419111C0504120B121B06010D0C0E1407120E0B17021C0C1D0D180A17071213140E1B1D043E130D140B0606080C091F001F1F1418161F1C0833591149515B0304101B0211050F051B01130013081D0A0013000E0A11190800061B01131A03180F1205061C0E0A13010A120502041E1D0C0904091302000E0A1501081804151C0E0A15010D12050209060F0C0904030E0417131A0C0904001506090E0A15031507121319160B03041D0A04140C15000C0904181D030C13031F03051D1D030C171A0C0908090813041E121404130B02131916070208021A0E151C0E0A191E02011409110E0A1E1D1D0A0E04160E0A1F0A1D0A0E0F040E0A1F0000070F141916011F1E00001D030A05001C02000A1D03171B181511051B1305041C12141B00091D033E17041B000E143C4E195A514A08001C150F19170F0411040A141B00161B130C15070E0919170311040D12040A00000D1B1104000415020B12150306070F02000012150306070F020000071E0A1D0B0F1300001E0204120B121B00021D1F031D0B10120C02031503151204150B1B12151E1012041411131A1511041B1308131B1D19020F120412160E0B06080F1A121B00040B020F00000A1B000A0D180C0F09041B000A1E151F1512041F151D1D15091D0B191717171D03110435020202001D04183C471D4F5A4808110A041207060C1E12160C081C160E0B161D0C0B0007150F19140F1D040D171D01041C12160C0F1D1D010400030C0B001D090E0A1C121608040A03060619121608131C04150A0E0819010C12070E0B13020C0B0800000906171216040F0F0F040C13020C0B081C0C03041E0B0C0B081D091B031B1D18040F091D010C0612160415000414160E081C04060615141914021F1F081D151B031E010708131D1D01090103190915061D01090B1216020E1207080A060C11010D1207081717160C0B0E1C12060917121602131B0C1B031D1B1E09001A08080B0E0802011D0813080213000311071B0F0319141B0203081A1415000E08051903010D1B030B070C0B3A070B0C081D1C2D441D465E5D0213020C0A00020D02170B12170C0C0B1D0004000A15031D09030E1F0E0914031D09040619150B1E191D090409111B0017110609040219150716191D0908011101121704170B121B021B1819030612060B04011D0C0A0D0B1D00091D0C11011D090D08071D12170000070D1B021F010C0A0C161D000A1E0A0C0A0E0205170A1B00041106010D011915011F1106010E001915011F0A0D0B1D000A0212170217120615041B00170813120615040206190E121206150406070311061C04020B0E090204110B1D00171D1B0011061B02040C0E09050A041206120C160B0C0A140715061701121718131B1D003E130C14080709090E091F00001C131D1512120B33591149515B0F041F0C051F061209060B150105191D060012160E06150C0D1A090404000B0C050402111B0D171C1511090B130A000112180411060E17191A07040C0206081B0D1B180C050E0D0A021C0E061F0105070F00160E061F01080A001E191A011D08050B1108110E061F00041D1D0F0A1C0A111109011314000E061F1E151209081606071E0A1D060E13001E0B03110901150A041B020C050E1B1202191A010711091D0304191A170503050F081B0D29051D03131A143A4C0E464F57080C0C1B0C110C1311080D041B0C111B0C0407031D0E0C1C0B041108030C08191B031D0203070D0E001C121903051B1213171B0B03110800070E0B1B1A191108000708191B00171108000A1B0C1C1D0404151B1502191B000318130B1D0E0B06121903150B13090406071F0300021D0E0B040B03190C0B0F13160E070004130F0F00040E07020412061D0E160612191E150F0F05101E121919001B1D0E1211121936050B0D0A0B1D1F021E1533481B4D4D541A0C061B001519180F060C1D04020519180B041715120B0212170202141D040D041918021C110B010314191801121813091D0D15001D0C07140B0608160E042B080C01113A4C0E464F570A0F1401001C121B0905071D0C0C13121B040C120A0E0B160B02110A0715040D17000C060819081B0E1D0B1C031D050E0A04061D05110A1C051B0E000B14110A170E130A0E052B080606080A0B021C07141B33481B4D4D541C0C020F081F040E021103020F12130000121C0C0F0A1D0B041C0A0202170B131B09131D11010D0B1D0B0406121C0C151C0E05000E02111A1D0200101C171C0C01051D1D0B00131D15110D0B020B00000D0C010409000B191E0B081812120D000706121C04000712080B0E0219090D120D0E0317121C04070B12131C1E0B0C01080909130C1C090C01080308130016121C040C011D0B0C1C0A15110D070F0C191E0706081D02081F0C1E121C0200001D0B0A130003110D010D1B091D0014020F120D0811060B0C010E1A1508191E0106081D021503191E1A140C1D0214170C1C121C18190B1D0B100A1B02141D023A060711071B1F121A14111C2F470C455E540C0601000714110C0F0801191F0F191E0E001D0A041C121D0C0F0F060208170004110C0F0F000A0E03111F0A0B151B08131C1B0815070F00191F0F0206041A121B08131C02040E1A151B08100F0C00040A0806191F0B15191D03040B071D1B020304120C020817121D080C01130E041E121D080F120C020B07121D080E120C0E041F070C00080D1308161D0804110C070D1B081B0019110C03001B081D0C19110C010506191F0115110C01081B081D030C000E0000140D0E031F0304171D0A0A1C1A12010000021B081D1C1D020F120C08170609110A04120C0816110107110C0115081711171301041D1D0A0A04121D021707041B081D18191E150F131B0806000C00151E021B08061C0C00141D0412080E030519140B0D0B000E032B0C020A04000D19021D030E1E101516061B061A19171B3A4C0E464F570F0F05021D0E00110A0E17001B0B130315110F0F171E191C0B13110F0B151B0B171A120C0F051D090006191F1F0A120F0210011A111F1D000410191C0B071E1D00041F1001121E0A0E120F0F0E0E00190E0E120F0E0B180F0C03081D12060B0E001F06080F1D091713121E1F16120F13110E00090E1D003A0606170817040D011115100833591149515B08071B121F0B07070202191D0519030019001B0A1F0B170C1D010F02191D0017110E000D1B0A1C02190304120E080A0E01020C0202041B0A000F1E0A04120E15020E01020A00000804191D1D110600120E1316070511110E18091B0A1F470C455E541106021712000C0F0B13060C0E1E111F081D1D1704001A1E08131D1D1704001A0311110F13131C0E1E15191D1E0906171F0F13141D1E090E091B1E031111060E130A0E1E180215010615040206091111060E130A01120005181D0808190207110A041A1D170C111D0C1D080D1502110E1E190E151B1302160E1E19030612110E0B191200041B14001B151E0F13081D1E0D061C0E1E1C0C181D1506111B011E111102140A071B0017111102141419020118011D1E0E0C000012000213001D170A011A0C1D130F190E19021C151E121211150A0E1E0202051211150A161B131908010F1419021C1F0B1D1E130815171C0404041D1D17171D1E151F15171D17171D1A150E15070E0919021B1211113500020315061B010C0013141105172D441D465E5D1402011E11101B0405001112010C481249585F000F13040F091D15001302040213121302041E1A0911130B020E15171D0C1F040A1D1500161D04020F0B1D15001A0F1211130B0814000E1C1504120B0F1B1717070411130B0F1B1717000411130B0F13041E1D0C1F041E000E170E1C151D0E1C151B17171E050F0D0702060B0E1C151E1512130216060F051F0000151B171718190816121302131B0B071E1D1C08040D0E1C190E0E061D150C1D12020411121308061A0B02111301020C160E1C1F0904011D1516041E0C1F1406131B1707000C1F160B1D151C070509181D1C3A020A011B0730481249585F010F111F0D0F0F0319010F1B18130F1D14041E0B0C1E000312120B1512030C0F0A170E0E0E1D11030518080C061D1C1F000000151B1613001F0B08121206150E1D111D0E121206171E12030C19011D14070112030E00121204070E1D13050C07051319010D18020D0F13140D1B1E0311120D09080A1E12030E091B0D0219010D181A001C1B1B1611071503020B1D14061D1C0C1E0201151B16170F0411120B0212171B1A0911120B040C19010B1E08131212021704071308121212021317000C1E04191D14000A12030819171D140D1B0503050012120F0A171D0C1E0901161B161A1C191F00031D140C1C091C081212120E11171203060812120C1C0E1D1B14110B1D140B11080C1E0E0D0202170E1D1F0E080F0D1B161D08041A001C041B161D06051112010D06170E1D1F01141A08080B011203020F171D140A0B12031D000D041B160207150A04021D1415000B1109030B15130C1C090C1E13021D1411130A1111121A00150D070C0C1E150F15080C1E1203190212121306151C1F18111212130A110518020D031D1411070A19021D1D1512010B1203191802041B16070D1B1E1D1D1417151E07151E1D1D1417151E170C1E141E1108170612031813081D14100009151F181212121F0705191112190013061A12031A081D121B160B0A1E081812121E16060B1D1E1D1D3A0607110A150A09070B0C091F001F1F151B171F1C0833591149515B13041012040C081E040E19060F040C0C011508170112040C150F131B11131A04020E1215061D0E1A111508121502041F12040802061D130011061E020D01061E19060B1C11150B0D02031D00190E0012150208131D15061D1A04090B1B1D0C19090A1D130D170F04081312150F00131A02081D1A08040E171A0311150704090113120404111D1D130C000B031115071308090E1A1F0900171D130A19171F1115010E0B160E1A1F1D1D1A0E15040B12040212060805040E1A1F18131D1D130A05000C190E170E13040E1A1F141212151504160B0C19130F050E0B1512041F00070F0E0B1512041F0018040B19061C051E151215120C0E1A2B0E0508060F0F19021D030E1C1511120833591149515B12070112050308180415161B1A091114000E1B101D020C183A0F060C160B142D441D465E5D13130D111908010F1419040F1E0C1D18040004011206080F1A14150001120608131D08040D171C050306121702110E18190C0B0B121B131B0A15021D18080B09131D0C1B08001D110C000919031D1808140C1D000C1B081D15061904070319001E130E0B06120604170F1D1109130F1E09041C0409190401140600121708111712060215070F0019040104021D180E1E04150B0C1B3A0F0202021B000530481249585F050F1C081212160609060B0211160F0F0019050F040E0912160207110F1D11160B03140C060B0C1A040A1D1000160A1903061216020C001207050E1D160F0A0E1919080F12160E0E1B1207040D020806081A071C011D1908091905071E090E19121B121B0015111603041B121D1C1B111601130C160E191F1F0D0A1D1011111207190712163C030133591149515BA9D0BCD50CBDD0BED4B7DE0EBEC4BDD4BFE3B7DD0EBECABDDFBEDD1BB5CEBECABDD512B1DBB5CCBECD11B1D2B1D9B4F3BECABDD3BED11BB5CCBECDBDDABED1B7DCA2D30CBDDFBFE1B7D60EBFF0BCE2BFE01BB4F2BFF411B0EFB1D7B5CBBFF211B0EFB0E7B5C312A1EEB1D4B0E719A0F5A0DDB1D91DB2D5A7CFA5D81DB9C6B0F0A5F30CB5C6B6D0BFC2ABEBA9EEB8E61DBFC2ABEAA8CAB9DFB9C8BCF412A8CAB8EAB9CBBDC0B6D7B5C7B6D01BBDD5B7F4B5D2B6D8BEEDAAC1A9E7B9C71DBFC2ABEAA9E8B9D4B9D6BDDA12A8CAB8EBB9C0BDC3B6D7B5CB12B9C0BEFEB6C1B5C6B7E71BBDDAB6D7B5D3B6C6BFD40EB6D8B7DFB6C6BFD4AAC40CB5CBB7E9BEE3AADD0CB5D2B7E9BFCAAAC9A9EB1DB6D2BEEDAADFA9E7B9C71DBFD1AAC6A9EEB9C71DBFDCAADFA8CAB8EC1DBFDCABEBA8CAB8E81DBEE4ABEAA8DEB9D9B8EDBCF412A9EFB9D9B9D619ABEDA9E5B8EB1DBEE0AADBA8DC1DB7E4BEE1ABE4A8DEB8E4B9C019ABEBA9E5B8ECB9DE1992CAE58DC4E781C3CB0E8ED4C581CBE687C1ED1290C9CC8EC5D985D6DE90C9C51281C3DD92CAF28DC5F981C3C592CAD81181C8CC87C3CC8ED6DD81C8C51B85DAC390C5DF8EC9D785DACA0C8DCBC381CDDB92C4C08DCBCA1D87CBF58EDEC581C1EC87CBD68EDED281C0CE87CBCC1290C3E68ECFD585DCF790C2EC8ECFF285DDE60C8DCFF481C9DA92C0E98DCEE381C9F092C0DA8DCEE381C9CF92C1F28DCFDE81C8E80E8EC0C081DEDF87D5C28EC0C981DFEC1B85C4D390DBE38ED7FD85C5E10C8DD9EA81DFC892D6D11181D7E587DDE58EC8CF1D8FE2F584F1FA0C8EE0D182E5F691EFDA1182ECD184E6CE8DF2DD82EDCA1B86F0DD93EEC11285DFF395FBFC1185D6CC83DAD31294D5CC8BFADA1996D6DD88FDE51D83DDDF88E6EA86D3F01B81CEEF94D5FB1285DAFE97DFC11185D1C081E4DD1295ECC48BDBD01997EBDB88ECC81D82E0DE8BFFD51D8BE4CB82E9E40C88EEDE87DEDB0E8BFFDD86EFC21B80E7E895F2EF1284F2E397D4E71184FBE781C5F51295F1C989DBD81997CAD78BEAD11D82CDC38AC9FD1D8BD6C28DD3E20C88D8D185DFF90E88F5E584F8E51B83FAFF97E5D08ADCC71994E7FB8BFDD41D81F1CD8BFACC1D88F5D880C8F20C8BF7DE84EDC597F3D11187F8D18EF2C91296FAD78BD1FD1994F2CA8BFFEA1D81D2D387D9C188FAC01B83CAD696E5EE1286E5DC95F2FB1186C9DA82EFDA1297D6E589DAE083EED496F3E51286DAF497F3F01186D3F082DFE51297D0F089DAFB199ADEC78BCCE21D8EFEF48BEBCF1D87C2F980FAC796D8C71288C3F597E0F51188C8F881DDDD129BE6D685E5D01999E5C781DADA1D8BE7CE82F4DC1D83F4FB8FC7C30C150301191B1D171C1F151D160809190A002C403D43505607460D43091D160F3B482E43411C10195354040E161E314C324C5455001C47141D160F3B482E43430F121A5157080E161E314C324C5401015A445E06121909395F325D5E045E035055450B0C150F324C3B48411E081859051D1F0B2E432C40555C0255014B0F0C150F324C3B48465B121F0B57021B1D1C325D314C5A541654430D0C150F324C3B484609121F08031D1F0B2E432C40545B10105140090C150F324C3B48475B0115540A1D1F0B2E432C405708131D5D40090C150F324C3B48441F0154595803541D1E1208033D433D4A5D420F14150905121B1D1C325D314C5651060A405F111119003D4A395F56400C120B0903070E161E314C324C5F55131D070A1D160F3B482E43495D005D0004190A002C403D435857041B1D0C150F324C3B484B0A121C530F1D1F0B2E432C40580B155257071208033D433D4A074619465D54080415010E161E314C324C04541318171119003D4A395F0D420F1359061B1D1C325D314C0D06530719070C150F324C3B4811021305025E040655105C175F00570604010E161E314C324C041F0058495903121909395F325D0E1B1C1257110E161E314C324C041F001B42091D160F3B482E43145C000D0B54070E161E314C324C03541302161119003D4A395F0B161B1856590F190A002C403D430414110459450A1D160F3B482E431605030B081B1D1C325D314C0808165740561358091D1D1F0B2E432C400707105151101208033D433D4A031B1F035512121909395F325D0B081F1B5E160E161E314C324C010F0359425D00121909395F325D0B0D19525254171208033D433D4A03020D0207580D5203190A002C403D43071D06400D4908530D1D1F0B2E432C40060B02150F4B0D0C150F324C3B481A5C121F0B57021B1D1C325D314C0619135D435A151119003D4A395F07410F570C500653135C151119003D4A395F071D1F545F5209190A002C403D430808551359191119003D4A395F04410C04081D1F0B2E432C400B5F000A0D0E161E314C324C0D53055F495E06121909395F325D06021C195052165F085900121909395F325D06111C165656161208033D433D4A0E021C0958560A1D1F0B2E432C400A1E1413561B1208033D433D4A09430F130E1D160F3B482E431C0A030C001354130A48071D160F3B482E431D0A0357001007141208033D433D4A08150C115E005D040D110E161E314C324C0A02100F430C55085051040E161E314C324C0A02100F1100560F590F190A002C403D430C0007130C420F05121909395F325D00060C001E0D4509000C1D160F3B482E431D0A030C095604455F151119003D4A395F03170F025E005E04080D171119003D4A395F03170F041C115304470A440C13121909395F325D00060C110B5714060C150F324C3B481F091219195C031B1D1C325D314C0306051D460D145D000C1D1F0B2E432C400C05500510465A131119003D4A395F030819105F0C1B1D1C325D314C00060506470F0A091D160F3B482E431E02050B1D1F0B2E432C400F1F1750030E161E314C324C09140459161E515E040A040E161E314C324C091C0317425B00121909395F325D02520D16530D0E161E314C324C0802101E165507021D1F0B2E432C40115F0004030E161E314C324C175413070C150F324C3B480209121E510A091B1D1C325D314C1E12141C401B0C150F324C3B4803571A14035A021B1D1C325D314C1F020C04431E1D0E1D160F3B482E43011500031D1F0B2E432C40130610115C44090C150F324C3B480157121F0B57021B1D1C325D314C1D041450475A171119003D4A395F1A465D035B5706190A002C403D4315040E050B0C150F324C3B480700051D55171D1F0B2E432C40170B130A021700030F041C00130000325D0E150C1D1F0B2E432C40170B130A021700030F041C0013101C092C401119031B1D1C325D314C18091610041208033D433D4A13071F485B500C1D1F0B2E432C401609030F54111208033D433D4A12150C1C5B00121909395F325D15091F545554101208033D433D4A1D190D420C0D5D091E00400F0C150F324C3B480A05135F0502520650170B40051D160F3B482E430954005D0016190A002C403D431801171D5A195B56011D1F0B2E432C401809030E5713031D151D160F3B482E430A0B135F5753070E1600081307001B1D0A160C151814481B4D4D54090C02061514190B0F1D0C191B0F1B1C1300140819121808011D0C111E09071D1E0A150F0C140E050E0F041F0F0C140E1B15120717120936041A3C4E195A514A17001C001B1F1B1E0C170E00041B1F070B020402061D1D3E1303073048471D1F0B2E432C403A32163B482F15404154561C3B125B470C"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Landroidx/core/util/PatternsCompat;->IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->STRICT_DOMAIN_NAME:Ljava/util/regex/Pattern;

    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "464F5749515B3C045F1431403B5E4C5E3EB0CE5D80FED18EC3E55F81C7E28ED9D14A8ACDC180FDE1EE4C97FACDD380CDE1EE4C97CACDD380DDE1EE4C97DACDD381EDE1EE4C96EACDD381FDE1EE4C96FACDD381CDE1EE4C96CACDD381DDE1EE4C96DACDD382EDE1EE4C95EACDD382FDE1EE4C95FACDD382CDE1EE4C95CACDD382DDE1EE4C95DACDD383EDE1EE4C94EACDD383FDE1EE4C94FACDD383CCE1EE4C94CACDD3564B3A30A3C73E90EEF04083EEEB3A87F2C692EDC88CE1C886F2EE2D303C465E5D3E13430A2C4C34514A5C29ACD0408CF1DE88C1F2439FDAEE81D6D7489DD1DF9DF1EEE14A95EDD1CD9DC1EEE14A95DDD1CD9DD1EEE14A95CDD1CD9CE1EEE14A94FDD1CD9CF1EEE14A94EDD1CD9CC1EEE14A94DDD1CD9CD1EEE14A94CDD1CD9FE1EEE14A97FDD1CD9FF1EEE14A97EDD1CD9FC1EEE14A97DDD1CD9FD1EEE14A97CDD1CD9EE1EEE14A96FDD1CD9EF1EEE14A96EDD1CD9EC0EEE14A96DDD1CD4B47353FA5C5298CF0ED4C8CE1ED3890EED88FE1C783E7CA91EEF0303C313D4A38095E5C5B50133A0648082F5D375143583CA7D2439DF2DE81C5E7489DD9FF82D6DE4C88DADD9EE0EDE14391F8DACF9ED0EDE14391C8DACF9EC0EDE14391D8DACF9FF0EDE14390E8DACF9FE0EDE14390F8DACF9FD0EDE14390C8DACF9FC0EDE14390D8DACF9CF0EDE14393E8DACF9CE0EDE14393F8DACF9CD0EDE14393C8DACF9CC0EDE14393D8DACF9DF0EDE14392E8DACF9DE0EDE14392F8DACF9DD1EDE14392C8DACF4856363FACC13C87F2EE5D8FE1E43C85E5DA8CF0C483EECE84E5F2332D304815514B540F464F573D404958582E3D59445E474A1B"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Landroidx/core/util/PatternsCompat;->IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->RELAXED_DOMAIN_NAME:Ljava/lang/String;

    .line 269
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "4658525B32031B410E3059455E52405D395D325F4449465E5D"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Landroidx/core/util/PatternsCompat;->STRICT_DOMAIN_NAME:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "474F4449515B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->WEB_URL_WITHOUT_PROTOCOL:Ljava/lang/String;

    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "4658525B32031B410E3059455E5449585F5A511957091A1517191A1A041D121213131602474A424E465E5D4D4D542B0C4C14204A3F4243493145324C3B3A2E402C463D4F3D4D395532583148324D3B5E2E512C4B3D533C1B4D4D542C483A0F4C01245F28404058331A55185B470B5C4D58551A4D4D542C5749515B3C045F1431403B5E4C5E3956325D313E324F3B4E2E4F2C473D493D4F395B325C315A325E3B432E532D1149515B3B40290F5D0B20432757484B330B5F1C47481C545E5C451048513D274C4D4758525B"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Landroidx/core/util/PatternsCompat;->RELAXED_DOMAIN_NAME:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "474F455E54"

    invoke-static {v7}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->WEB_URL_WITH_PROTOCOL:Ljava/lang/String;

    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "46"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroidx/core/util/PatternsCompat;->WEB_URL_WITH_PROTOCOL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "12"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroidx/core/util/PatternsCompat;->WEB_URL_WITHOUT_PROTOCOL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->AUTOLINK_WEB_URL:Ljava/util/regex/Pattern;

    const-string v0, "4658525B32031B410E3059455E543A0648082F5D375143583CA7D2439DF2DE81C5E7489DD9FF82D6DE4C88DADD9EE0EDE14391F8DACF9ED0EDE14391C8DACF9EC0EDE14391D8DACF9FF0EDE14390E8DACF9FE0EDE14390F8DACF9FD0EDE14390C8DACF9FC0EDE14390D8DACF9CF0EDE14393E8DACF9CE0EDE14393F8DACF9CD0EDE14393C8DACF9CC0EDE14393D8DACF9DF0EDE14392E8DACF9DE0EDE14392F8DACF9DD1EDE14392C8DACF4856363FACC13C87F2EE5D8FE1E43C85E5DA8CF0C483EECE84E5F2332D314A324C3840553358525B35004A1F33432A5D4C573AA5C55F83EFD28ECAE14A8AC5E19FDAD1438ED8CA82FEF0ED4C9EFED8D882CEF0ED4C9ECED8D882DEF0ED4C9EDED8D883EEF0ED4C9FEED8D883FEF0ED4C9FFED8D883CEF0ED4C9FCED8D883DEF0ED4C9FDED8D880EEF0ED4C9CEED8D880FEF0ED4C9CFED8D880CEF0ED4C9CCED8D880DEF0ED4C9CDED8D881EEF0ED4C9DEED8D881FEF0ED4C9DFED8D881CFF0ED4C9DCED8D854482B33A3CE3A85E5F24392EDEB3383E7CD90EED98FE1C182E7E52F332C463D433E42422E402D165142575518290F5D1720433B57484B35B2CD4C83FED88AD6EE5D82D6E18ED0D55F81CFC291FEE1E74882F1CFD091CEE1E74882C1CFD091DEE1E74882D1CFD090EEE1E74883E1CFD090FEE1E74883F1CFD090CEE1E74883C1CFD090DEE1E74883D1CFD093EEE1E74880E1CFD093FEE1E74880F1CFD093CEE1E74880C1CFD093DEE1E74880D1CFD092EEE1E74881E1CFD092FEE1E74881F1CFD092CFE1E74881C1CFD047483A39A7D23592EDE14383E7EF2F8CF0C583EEC885E5DD8DF0ED3C333D4C395F31554A3C475E274D4D535E1650425352500F464F573D1D1D43192C4759453A0F4C1D245F3440405835A3C7489FF1CF82C5EE4C88D2FD81C7DD4C81DEC895E2EEF04091F1DEDA95D2EEF04091C1DEDA95C2EEF04091D1DEDA94F2EEF04090E1DEDA94E2EEF04090F1DEDA94D2EEF04090C1DEDA94C2EEF04090D1DEDA97F2EEF04093E1DEDA97E2EEF04093F1DEDA97D2EEF04093C1DEDA97C2EEF04093D1DEDA96F2EEF04092E1DEDA96E2EEF04092F1DEDA96D3EEF04092C1DEDA4354352EAFC13583E7E55F8CF0E73C8CE1CF87F2C792EDCE8DE1E7382F3358525B35004A1F33432A5D4C573AA5C55F83EFD28ECAE14A8AC5E19FDAD1438ED8CA82FEF0ED4C9EFED8D882CEF0ED4C9ECED8D882DEF0ED4C9EDED8D883EEF0ED4C9FEED8D883FEF0ED4C9FFED8D883CEF0ED4C9FCED8D883DEF0ED4C9FDED8D880EEF0ED4C9CEED8D880FEF0ED4C9CFED8D880CEF0ED4C9CCED8D880DEF0ED4C9CDED8D881EEF0ED4C9DEED8D881FEF0ED4C9DFED8D881CFF0ED4C9DCED8D854482B33A3CE3A85E5F24392EDEB3383E7CD90EED98FE1C182E7E52F332F314C331A5749445F0D3600431B2648285E5D543AACC14A88EDD19FC9E1438ED0EA9DD9C0408ED1CE97F5F2EE5D9DFED1DC97C5F2EE5D9DCED1DC97D5F2EE5D9DDED1DC96E5F2EE5D9CEED1DC96F5F2EE5D9CFED1DC96C5F2EE5D9CCED1DC96D5F2EE5D9CDED1DC95E5F2EE5D9FEED1DC95F5F2EE5D9FFED1DC95C5F2EE5D9FCED1DC95D5F2EE5D9FDED1DC94E5F2EE5D9EEED1DC94F5F2EE5D9EFED1DC94C4F2EE5D9ECED1DC41432930B2CD3A8CE1E74890EEFA3083EEC985E5DB8CF0C282EEE13A382F470B5D4D5F1C3B4B5B4558150F324C3B48293207314C331A574947560D3116123A0648082F5D373AACC14A88EDD19FC9E1438ED0EA9DD9C0408ED1CE97F5F2EE5D9DFED1DC97C5F2EE5D9DCED1DC97D5F2EE5D9DDED1DC96E5F2EE5D9CEED1DC96F5F2EE5D9CFED1DC96C5F2EE5D9CCED1DC96D5F2EE5D9CDED1DC95E5F2EE5D9FEED1DC95F5F2EE5D9FFED1DC95C5F2EE5D9FCED1DC95D5F2EE5D9FDED1DC94E5F2EE5D9EEED1DC94F5F2EE5D9EFED1DC94C4F2EE5D9ECED1DC41432930B2CD3A8CE1E74890EEFA3083EEC985E5DB8CF0C282EEE13A382F154241575D1C4E4C5A514A310312451B3B5B47"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 332
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->AUTOLINK_EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    const-string v0, "3511401B2F4C3D555F572C463D403D383957325D314A331A5649405B46103D2E3A0648082F5D375143583A3E13430A2C4C34514A5C2E432D1651425753185A325E3600431B2648285E5D543C35004A1F33432A5D4C573D4A38095E5C5F5413484C"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 338
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/core/util/PatternsCompat;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
