$(document).ready(function (){
  console.log('本の登録機能JSを読み込みました');
});

$(document).on('click', '#isbn_submit_button', function (){
  let isbn = $('#isbn_form').val();
  isbn = normalizationIsbn(isbn);

  if ( validateIsbn(isbn) ) {
    console.log(`入力されたISBN: ${isbn}`);
    $.ajax({
      type: "GET",
      url: "/books/ajax_book_register",
      data: { 
        isbn_code: isbn
      }
    }).done(function(html) {
      $('#book_search_result').html(html);
    });
  } else {
    $('#book_search_result')
      .html("<strong>※ISBNコードのチェックに引っかかりました。もう一度確認してください。</strong>");
  }
  
});

function normalizationIsbn(isbn) {
  isbn = isbn.replace(/\D/g, '');
  isbn = isbn.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
    return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
  });
  return isbn
}

function validateIsbn(isbn) {
  if( isbn.length == 13 ) {
    return true;
  } else {
    return false;
  }
}
