
window.addEventListener('load', function(){

document.getElementById("test").addEventListener("click",function(){
  setTimeout(function(){

    result = prompt('と入力してください')
   if ( result === '了解') {
        alert('了解と入力されました');
    }
    else {
        alert('了解と入力されませんでした');
    }
  },3000);
});
})

