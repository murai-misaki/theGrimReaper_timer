##h2■ サービス名
死神タイマー　~1時間座り続けるごとにあなたの寿命を22分戴きます~


##h2■ サービス概要
1日のうちに長時間、座って作業をしている人に
30分に１回立ち上がることを習慣化させ、1時間座り続けると寿命が22分縮まることを防ぎ、1日8時間以上座ることによって高まる罹患リスクや死亡リスクを軽減させる
Webタイマーアプリ『死神タイマー』です。


##h2■メインのターゲットユーザー
(デスクワーカーや受験生、プログラミングの勉強や資格勉強をしている人など)
1日のうちに長時間、座って作業をしている人


##h2■ユーザーが抱える課題
- 1時間座り続けると寿命が22分縮む
- 1日8時間以上座っている人は、罹患リスクや死亡リスクが高まる
	(→座りすぎは肥満、がん、うつ病、糖尿病、高血圧、心疾患、脳梗塞など将来的にさまざまな病気を誘発すると考えられている)
- 座りすぎによるリスクを知らずに、長時間座りっぱなしの人は多い
	(→日本人の座る時間は平均8~9時間と、世界の中でも日本人はダントツで座っている時間が長い)
- ついつい長時間座り続けて、作業をしてしまう
- 座りっぱなしは水分不足になりやすく、これが血液の循環を悪くすることもある
- 運動不足


##h2■解決方法
- 座りすぎによるリスクを伝える
- 1日ごとの座っている時間を記録し、グラフ化して可視化できるようにする
- 1時間座り続けたことで縮んだ寿命の合計時間を計算し、座りすぎが健康に及ぼすリスクについて、ユーザーが自分自身の問題として捉えられるようにする
- 上記を知ることでユーザーは危機感から、30分に1回立ち上がり3分のブレイクタイムを設けることを習慣化できるようになる
- 1日に合計8時間座っている場合、通知によって注意喚起をする
- ブレイクタイム時に水分補給を促すメッセージを表示する
- ブレイクタイム時に、体を動かす4ジャンル(全身バランスよく・肩こり肩痛予防・腰痛膝痛予防・下肢筋力アップ)計13種類の1分程度の軽い運動を紹介する


##h2■実装予定の機能
- 未ログインユーザー
    - ユーザーがトップページで座りすぎのリスクについて知ることができる
	- ユーザーがトップページでタイマーの通知方法をプッシュ通知又はサウンド通知から選択できる
	- ユーザーがトップページでログインページに遷移できる
    - ユーザーがログインページの「パスワードをお忘れの方はこちら」のリンクから、パスワードリセット申請ページに遷移できる
    - ユーザーがパスワードリセット申請ページで入力したメールアドレスにURLが送られ、パスワードリセットページに遷移できる
    - ユーザーがパスワードリセットページでパスワードの再設定ができる
	- ユーザーが遷移したログインページにあるユーザー登録リンクからユーザー登録ページに遷移できる
	- ユーザーがトップページでカウントアップタイマーをスタートできる
	- ユーザーが選択した通知方法で30分経過の通知を受け取り、立ち上がるか(3分間のブレイクタイムを取るか)を選択できる
	- ユーザーが受け取った通知から立ち上がるを選択すると、自動的にブレイクタイムタイマーをスタートできる
	- ユーザーが受け取った通知から立ち上がらないを選択すると、自動的にカウントアップタイマーを再開できる
    - ユーザーがタイマーページでブレイクタイム時に、水分補給を促すメッセージを確認できる
    - ユーザーがタイマーページでブレイクタイム時に、体を動かす4ジャンル(全身バランスよく・肩こり肩痛予防・腰痛膝痛予防・下肢筋力アップ)計13種類の1分程度の軽い運動を紹介され、ユーザーはその中から好きな運動を選択して行うことができる
	- ユーザーがタイマーページでタイマーをストップ(一時停止)できる
    - ユーザーが1日に合計8時間座っている場合に(1日のタイマー可動時間が合計8時間になったら)、通知によって注意喚起をする
	- ユーザーがタイマーページでタイマーを終了できる
	- ユーザーがタイマーを終了した後に遷移したページでもう一度カウントアップタイマーをスタートできる
	- ユーザーがタイマーを終了した後に遷移したページでユーザー登録ページに遷移できる
	- ユーザーがユーザー登録ページでユーザー登録できる
	- ユーザーがユーザ登録ページにあるログインリンクからログインページに遷移できる

- ログインユーザー
    未ログインユーザーができる機能に加えて
	- ユーザーがログインページでログインすると、マイページに遷移できる
	- ユーザーがマイページでカウントアップタイマーをスタートできる
	- ユーザーがマイページで直近1週間の1日ごとの座っている時間を棒グラフで確認できる
	- ユーザーがマイページで1時間座り続けたことで縮んだ寿命の合計時間を確認できる
    - ユーザーがマイページで、1時間座り続けたことで縮んだ寿命の合計時間をtwitterでシェアできる
    　(→座りすぎのリスクについて全く知らない人でも、ユーザーのツイートを通じて当アプリについて知ってもらったり、興味を持ってもらえる機会にすることが目的です)
    - ユーザーがマイページから遷移した「みんなの死神が縮めた寿命ランキング」ページで、全ユーザーの1時間座り続けたことで縮んだ寿命の合計時間をランキング形式でワーストからトップまで紹介する。このランキングでは、個別にユーザーにスタンプをつけることができ、ユーザー同士でお互い応援や労いのスタンプを送り合うことができる。
    　(→ワーストに近いユーザーには褒め言葉のスタンプ、トップに近いユーザーには励ましの言葉のスタンプを送り、ユーザー同士が励まし合って、前向きに座りすぎを改善することに取り組めることが目的です)
    - ユーザーがマイページにあるユーザーアイコンからアカウント設定ページに遷移できる
    - ユーザーがアカウント設定ページでユーザーのプロフィールを更新できる
    - ユーザーがアカウント設定ページで1時間座り続けたことで縮んだ寿命の合計時間を「みんなの死神が縮めた寿命ランキング」に公開するかの、プライバシー設定ができる
    - ユーザーがアカウント設定ページでアカウント削除ができる
    - ユーザーがアカウント設定ページでパスワードの更新ができる
    - ユーザーがアカウント設定ページでログアウトできる


##h2■なぜこのサービスを作りたいのか？
座りすぎによるリスクについて、『1時間座り続けると、寿命が22分縮む』という事実を初めて知った時、衝撃を受けました。
それでも、目の前の作業に追われてついつい長時間座りっぱなしでいてしまい、30分に1回立ち上がることを実行することができませんでした。
このまま長時間座って作業を続けることを改善しないと、エンジニア転職後には、より積み重なり、長期化してしまう恐れがあります。
そして、エンジニアとして仕事や勉強を頑張れば頑張るほど、座りすぎによる寿命の短縮や死亡リスクが高まることに非常な危機感を抱きました。
そのため、自分自身のためにも、今後のエンジニア人生で長く使用できる「30分に1回立ち上がること」を確実に習慣化できるアプリを作りたいと強く思ったのがきっかけです。
そのために、単なるタイマーアプリではなく、もし立ち上がることを怠れば、自分自身の寿命が短くなることを実感でき、その危機感から実際に立ち上がらざるを得なくなるような、特別なタイマーアプリが欲しかったです。
また、日本人は世界でも座っている時間が最も長いとされ、座りすぎによるリスクについて十分に認識していない方が多いのではないかと考えました。
まずは、ユーザーの興味を引きつけ、アプリページをクリックしてもらえるようなインパクトが必要だと考えました。
そこで、座りすぎにより寿命が縮むことはまるで死神のようだと感じ、そのイメージを活かして、座りすぎによる健康リスクの恐ろしさを表現したインパクトのあるサービス名とコンセプトにしました。
このアプリを通じて、座りすぎの恐ろしさを伝え、無意識に座り続けることで寿命を縮めてしまうリスクを防ぐための対策アプリとして、日常的に利用していただけることを目指しています。


##h2■スケジュール
　企画〜技術調査：4/14〆切
　README〜ER図作成：4/30 〆切  (Vue.jsと・Rails APIのキャッチアップも並行して行う)
　メイン機能実装：5/1 - 5/31
　β版をRUNTEQ内リリース（MVP）：6/1〆切
　本番リリース：6/15


##h2■スタンディングデスクなどの物理的な解決策にはない当アプリの利点
**今までと同じ座っての作業環境で、手軽にすぐ、座りすぎによるリスクを防止をできることが利点だと考えました。**
2017年時点では、日本においてスタンディングデスクの普及率は10％以下でした。
現在では、普及率は上昇していると考えられますが、それでも実際にスタンディングデスクを所有して使用している人々はあまり多くないと思われます。
そのため、スタンディングデスクを自分の作業環境に導入する場合には、デスクを購入する手間や費用がかかるため、多くの人々が面倒だと感じてやめてしまうことがあると考えられます。
また私自身、学生時代から座って作業することに慣れているため、立って作業するよりも座って作業する方が楽で、じっくりと集中できると感じています。
また、ネット上でも、スタンディングデスクを使って腰や膝が痛くなったり、立ち続けることでの疲労が主な原因で、使用をやめる人々が多いです。
しかし、当アプリを利用することで、今までと同じ座っての作業環境で簡単に、座りすぎによるリスクを防止することができます。これは、当アプリの大きな利点の一つと言えます。


##h2■類似したサービスと当サービスの相違点や特徴
- タイマー使用前に座りすぎによるリスクについて具体的に知れること
- 1時間座り続けたことで縮んだ自分の寿命の合計時間を知れること
    →このように座りすぎによるリスクを知ってもらい、ユーザーが自分自身の問題として捉えるようにすることで、危機感を抱き、タイマーが鳴っても立ち上がりを怠らないように促すことができます。

- 他には類を見ないホラーチックな要素を取り入れたタイマーアプリで、ユーザーの興味を引くことができる
- ダウンロード不要ですぐに使用できること(座りすぎ防止に特化したタイマーアプリで、現在あるのはモバイルアプリのみ)

- ユーザーが好きなタイマーの通知方法を選択できること(プッシュ通知 or サウンド通知)
    →私は、作業中に突然アラーム音が鳴るのに驚いてしまい作業中のストレスになるため、既存の代替可能なサービスの利用を控えていました。私のようなアラーム音が苦手な人や、オフィスや図書館などでアラーム音を出すことができない環境でも使用できることは、他のタイマーアプリとの大きな違いだと思います。

- 座りすぎによるリスク対策として、単に30分に1度立ち上がることを促すだけでなく、1日8時間以上座ることによって高まる罹患リスクや死亡リスク、運動不足、水分不足などの、座りすぎによって引き起こされる「1時間座り続けると寿命が22分縮む」以外の問題についても解決できる機能が備わっていること
　  - 30分に1回ブレイクタイム時に水分補給を促すメッセージを表示する
　  - 1日に8時間以上座り続ける場合に通知によって注意喚起を行い、罹患リスクや死亡リスクが高まるのを防ぐためのサポートをする機能
　  - ブレイクタイム時に体を動かす4ジャンル計13種類の1分程度の軽い運動を紹介する、運動不足解消のための機能
　  - ユーザー同士のスタンプコミュニケーション機能 (ユーザー同士が励まし合って前向きに座りすぎを改善することに取り組めるように)