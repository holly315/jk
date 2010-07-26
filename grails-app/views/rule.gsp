<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title>遊び方</title>
		<style TYPE="text/css">
		<!--
			.moji{
				font-size:30;
				color:red;
			}
			.body{
				text-align:center;
				font-weight:bold;
			}
			
	
			.migi{
				float:right;
				font-size:20;
			}
			.moji2{
				font-size:30pt;
				color:black;
			}
			
		-->
		</style>
    </head>
    <body>
            <span class="migi" ><a href="${createLink(uri: '/')}" ><g:message code="default.home.label"/></a></span>
        <div class="body"><br><br>
       <span class="moji"> 遊び方</span><br>
<span class="moji2">ゲームの目的</span></br>
    あなたは動物となり、食料不足のためマップ上に一つしかない餌を巡って骨肉の争いを繰り広げなければなりません。</br>
</br>
１　新規登録</br>
    名前とパスワードを入力し、その後あなたがなりたい動物を用意されている５種類の中から選択してください。</br>
    ちなみに、各動物には得意な相手、不得意な相手が存在します。</br>
</br>
    鹿　これと言って得意な相手も苦手な相手もいませんが、虎や熊を相手にした際は多少上下します。</br>
    兎　自分より遥かに大柄な肉食獣に対しなぜか優位に立つことができますが、猫だけは苦手です。</br>
    虎　鹿や猫には強く、また苦手とする相手と対峙してもその影響は小さめです。</br>
    熊　猫科の動物相手に有利な動物です。ただし、草食獣相手には妙に弱いところがあります。</br>
    猫　本能的なものなのか、兎に対し圧倒的な強さを見せつけますが、猛獣には歯が立ちません。</br>
   </br>
    登録ボタンを押したらメニュー画面から</br>
    名前とパスワードを入力してログインしてください。</br>
</br>
２　巣</br>
    ゲームの世界にログインしたあなたは、まず自分の巣で目覚めます。</br>
</br>
   	<img src="/jk/images/t_home.png" width="700px" height="400px"  >
</br>
</br>
    現在のあなたのHPやストックしている餌の数などを見ることができます。</br>
    それでは外へ出ましょう。そこが戦場です。</br>
</br>
    ゲームを終了する際には、必ずこの巣からログアウトをしてください。</br>
   </br>
３　エリアマップ</br>
    巣から一歩でも出ると、そこは広大な自然のコロシアム。</br>
    あなたはここで餌を探し集め、時には他の動物との激しい闘争を繰り広げます。</br>
</br>
	<img src="/jk/images/t_map.png"  width="700px" height="400px" >
   	</br>
   </br>
    画面右上に全体マップがあります。</br>
   </br>
    巣から出たら餌を探しましょう。</br>
    えさのあるエリアと現在地エリアが表示されているのでそれをヒントに進めてください。</br>
   </br>
    東西南北のボタンをクリックすると、その方向へ移動できます。</br>
   </br>
    歩くごとに体力が２％減っていきます。</br>
    まれに落とし穴にはまることがあります。その場合体力が２５％減ります。</br>
   </br>
    体力は０％になっても移動は可能です</br>
   </br>
    回復する場合は餌を使用すると全回復します。その際左下の餌の残量が一つ減ります。</br>
   </br>
    餌は最大で３つまでストック可能です。</br>
   </br>
    餌を発見するとストックが一つ増えます。</br>
    また、マップ上に新しい餌が追加されます。</br>
   </br>
    ストックが３つの状態で餌を発見した場合はその餌は破棄され新たな餌が追加されます。</br>
   </br>
   </br>
４　戦闘</br>
    既に他のプレイヤーがいるマスに移動しようとしたり、逆に自分のいるマスに他のプレイヤーが入ってきた場合、戦闘に突入します。</br>
   </br>
    <img src="/jk/images/t_encount.png"  width="700px" height="400px"  >
   	</br>
   </br>
    厳しい野生の中では逃げることは許されません。</br>
    画面上部に佇む「勝負!」ボタンが、あなたを闘争へといざなうでしょう。</br>
    お互いの体力と相性を元に勝敗が決まります。</br>
    相性については以下の表を参考にしてください。</br>
   </br>
    有利ーーー不利</br>
    ◎○△ー▼×※</br>
   </br>
   <table border=1 align="center">
   <tr>
    <th></th><th>鹿</th><th>兎</th><th>虎</th><th>熊</th><th>猫</th>
   </tr>
   <tr>
    <td>鹿</td><td>＼</td><td>ー</td><td>▼</td><td>△</td><td>ー</td>
   </tr>
   <tr>
    <td>兎</td><td>ー</td><td>＼</td><td>△</td><td>○</td><td>※</td>
   </tr>
   <tr>
    <td>虎</td><td>△</td><td>▼</td><td>＼</td><td>▼</td><td>○</td>
   </tr>
   <tr>
    <td>熊</td><td>▼</td><td>×</td><td>△</td><td>＼</td><td>○</td>
   </tr>
   <tr>
    <td>猫</td><td>ー</td><td>◎</td><td>×</td><td>×</td><td>＼</td>
   </tr>
 </table>
   </br>
   </br>
   この相性とは別に発見したほうが有利な状況となります。<br>
    戦いは一瞬で決まり、次の瞬間には結果のみが残ります。</br>
    野生のおきてに従い、勝者は敗者から餌をひとつ奪い取ることができます。</br>
   </br>
    <img src="/jk/images/t_win.png" width="700px" height="400px" >
   	</br>
   </br>
    敗れた動物は無様にも餌を奪われた揚句巣に逃げ帰る羽目になってしまいます。</br>
   </br>
    <img src="/jk/images/t_lose.png"  width="700px" height="400px"  >
   	</br>
   </br>
    引き分けの場合はお互いの餌を一つずつ失います。</br>
   </br>
    <img src="/jk/images/t_draw.png"  width="700px" height="400px"  >
   	</br>
   </br>
    餌のストックがない状態で負けた場合は、あなた自身が餌になり果てます。</br>
   </br>
    <img src="/jk/images/t_dead.png"  width="700px" height="400px"  >
   	</br>
   </br>
    その時点でGAMEOVERとなり、アカウントが削除されます。</br>
    こうなってしまうと二度と復活できません。新規登録からやり直してください。</br>
   </br>
   </br>
</div>
            <span class="migi" ><a href="${createLink(uri: '/')}" ><g:message code="default.home.label"/></a></span>
    </body>
</html>