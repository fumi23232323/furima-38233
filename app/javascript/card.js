const pay = () => {
  // PAY.JPテスト公開鍵
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // 入力フォーム:変数定義
  const form = document.getElementById("charge-form");
  // 実行
  form.addEventListener("submit", (e) => {
    // submitボタンを押すと発生する標準設定イベントの阻止
    e.preventDefault();
    // "charge-form"で情報を取得し、フォームに入力された値を取得できるオブジェクトとして生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // FormDataオブジェクトからクレジットカード情報を取得し、変数cardに代入するオブジェクトを定義（name属性値）
    const card = {
      number: formData.get("order_form[number]"),
      cvc: formData.get("order_form[cvc]"),
      exp_month: formData.get("order_form[exp_month]"),
      exp_year: `20${formData.get("order_form[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        // response.idとすることでトークンの値を取得
        const token = response.id;
        // HTMLのinput要素にトークンの値を埋め込み、フォームに追加
        const renderDom = document.getElementById("charge-form");
        // valueは実際に送られる値、nameはその値を示すプロパティ名
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        // フォームの中に作成したinput要素を追加（内部の最後の子要素の後に挿入）
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // フォームに存在するクレジットカードの各情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    })
  })
}

// payページを読み込んだ時に実行
window.addEventListener("load", pay);